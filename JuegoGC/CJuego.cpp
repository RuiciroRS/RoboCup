#include <alvalue/alvalue.h>
#include <alcommon/alproxy.h>
#include <alcommon/albroker.h>
#include <qi/log.hpp>
#include <althread/alcriticalsection.h>

#include <opencv2/core/core.hpp>
#include <opencv2/highgui/highgui.hpp>
#include "opencv2/opencv.hpp"
#include <qi/path.hpp>

#include "Goalkeeper.h"
//Si no sale...fue culpa del gobierno...
#include "CJuego.h"
#include "RoboCupGameControlData.h"


#define TEAM_NUMBER 5
#define TEAM_COLOR 1
#define PLAYER_NUMBER 2
#define GIRO 1,57075  //derecha -, izquierda+
#define PORT 10041


//std::string Modulename1;
boost::shared_ptr<AL::ALBroker> broker_Global;
CJuego::CJuego(
  boost::shared_ptr<AL::ALBroker> broker,
  const std::string& name): AL::ALModule(broker, name),
    fCallbackMutex(AL::ALMutex::createALMutex())
{
  setModuleDescription("This module probe de Game Controler for SPL 2017.");
  functionName("ChestButtonPressed", getName(), "Method called when the chest button is pressed.");
  BIND_METHOD(CJuego::ChestButtonPressed);
  functionName("onRobotFallen", getName(), "Method called when the robot fallen.");
    BIND_METHOD(CJuego::onRobotFallen);
  //  functionName("ballDetected", getName(), "Guarda en variable");
 // BIND_METHOD(CJuego::ballDetected);


  std::cout << "constr" << std::endl;
  //Modulename1 = name;
  broker_Global = broker;
  AL::ALModule::createModule<Goalkeeper>(broker, "Goalkeeper");
	mComportamiento = DELANTERO;

        bTracking =  false;
        bMustStop = false;
	bTirando = false;
	bPenalized = false;
	mCountLost = 0;

	std::cout << "Intancia CJuego creada" << name << std::endl << std::flush;
}

//----------------------------------------------------------------------------------

CJuego::~CJuego() {

}

//----------------------------------------------------------------------------------

void CJuego::ChestButtonPressed(){
	std::cout << "Chest button pressed"<< std::endl << std::flush;
	bPenalized = !bPenalized;
	if (bPenalized)
		fMotionProxy.setWalkTargetVelocity(0.0, 0.0, 0.0, 0.5);
	else{   
	     fMotionProxy.moveTo(0.5,0.0,0.0);
	     fMotionProxy.waitUntilMoveIsFinished();
	     play();
	}
		
	//mGCData.state = STATE_PLAYING;
}

//----------------------------------------------------------------------------------

void CJuego::onRobotFallen()
{
	AL::ALCriticalSection section(fCallbackMutex);
	std::cout << "ouch, me cai" << std::endl << std::flush;
        fRobotPostureProxy = AL::ALRobotPostureProxy(getParentBroker());
	qi::os::sleep(0.1f);
        fRobotPostureProxy.goToPosture("Stand", 80.0/100.0);
	qi::os::sleep(1.0f);
}

//----------------------------------------------------------------------------------

void CJuego::init() {
    try {   
     fMotionProxy = AL::ALMotionProxy(getParentBroker());

    }catch (const AL::ALError& e) {
      qiLogError("module.example") << e.what() << std::endl;
    }

    try {   
     fcamProxy = AL::ALVideoDeviceProxy(getParentBroker());
     std::cout << "calling time 1" << std::endl << std::flush;
     fcamProxy.setParam(18,AL::kBottomCamera); 
     
    }catch (const AL::ALError& e) {
      qiLogError("module.example") << e.what() << std::endl;
    }


  try {
    /** Create a proxy to ALMemory.
    */ 
    fMemoryProxy = AL::ALMemoryProxy(getParentBroker());
    std::cout << "Proxy a memoria creado" << std::endl << std::flush;

    fMemoryProxy.subscribeToEvent("ChestButtonPressed", "CJuego",
                                  "ChestButtonPressed");
    fMemoryProxy.subscribeToEvent("robotHasFallen", "CJuego",
                                 "onRobotFallen");
 
    fMemoryProxy.insertData("GameCtrl/teamNumber", TEAM_NUMBER);
    fMemoryProxy.insertData("GameCtrl/teamColour", TEAM_COLOR);
    fMemoryProxy.insertData("GameCtrl/playerNumber", PLAYER_NUMBER);
    std::cout << "Datos escritos en memoria" << std::endl << std::flush;

  //  time(&mLastTime);   
  
  }
  catch (const AL::ALError& e) {
    qiLogError("module.example") << e.what() << std::endl;
    return;
  }

  mpreviousState = -1;
  memset(&mStdMessage, 0, sizeof(mStdMessage));
  memset(&mGCData, 0, sizeof(mGCData));

  mStdMessage.header[0]='S';
  mStdMessage.header[1]='P';
  mStdMessage.header[2]='L';
  mStdMessage.header[3]=' ';      
  mStdMessage.version = SPL_STANDARD_MESSAGE_STRUCT_VERSION; 
  mStdMessage.playerNum = PLAYER_NUMBER;
  mStdMessage.teamNum = TEAM_NUMBER;        

  std::cout << "Llamando a acciones" << std::endl << std::flush;
  acciones();
  return;

}

//----------------------------------------------------------------------------------

void CJuego::buildStdMessage(int intention, int distPel)
{
 	
}

//----------------------------------------------------------------------------------

void CJuego::acciones()
{ 
    while(1){
		

        AL::ALValue value = fMemoryProxy.getData("GameCtrl/RoboCupGameControlData");
        if (value.isBinary() && value.getSize() == sizeof(RoboCupGameControlData)){
             memcpy(&mGCData, value, sizeof(RoboCupGameControlData));
//	     std::cout << "paquete leido" << std::endl;
            if(mGCData.state != mpreviousState){
              std::cout << "edo" << mGCData.state << std::endl << std::flush;
		  switch(mGCData.state)
		  {
		    case STATE_READY:
		      std::cout << "STATE_READY" << std::endl << std::flush;
	              ready();
		      break;
		    case STATE_SET:
		      std::cout << "STATE_SET" << std::endl << std::flush;
		      set();
		      break;
		    case STATE_PLAYING:
		      std::cout << "STATE_PLAYING" << std::endl << std::flush;
                      play();
		      break;
		    case STATE_FINISHED:
		      std::cout << "STATE_FINISHED" << std::endl << std::flush;
                      finish();
		      break;
		    case STATE_INITIAL:
		      std::cout << "STATE_INITIAL" << std::endl << std::flush;
		      break;
		    default:
		      break;
		  }
		mpreviousState = mGCData.state;
            }
	}
     }
     return;
	
}

//----------------------------------------------------------------------------------

void CJuego::ready()
{
  std::cout << "1" << std::endl << std::flush;
	// Agregar codigo para el comportamiento en el estado ready

	return;
}

//----------------------------------------------------------------------------------

void CJuego::set()
{
  std::cout << "2" << std::endl << std::flush;
	// Agregar codigo para el comportamiento en el estado set
	return;
}

//----------------------------------------------------------------------------------

// void CJuego::caidaizq()
// {
//   std::string behaviorID;
//   behaviorID = fFrameManagerProxy.newBehaviorFromFile("/home/nao/caida1.xar", "");
//   fFrameManagerProxy.completeBehavior(behaviorID);
//   std::cout << "Caida a la izquierda" << std::endl << std::flush;
//   qiLogInfo("CJuego") << "logcaidaIzq" << std::endl;
// }

// void CJuego::caidader()
// {
//   std::string behaviorID;
//   behaviorID = fFrameManagerProxy.newBehaviorFromFile("/home/nao/caida2.xar", "");
//   fFrameManagerProxy.completeBehavior(behaviorID);
//   std::cout << "Caida a la derecha" << std::endl << std::flush;
//   qiLogInfo("CJuego") << "logcaidaDer" << std::endl;
// }

// void CJuego::leftBumperPressed()
// {
//   fMotionProxy.setStiffnesses("Head", 0.7);
//   fMotionProxy.setStiffnesses("Body", 0.7);
//   fPostureProxy.goToPosture("StandInit", 0.5f);
//   fMemoryProxy.subscribeToMicroEvent("EKBallDetected", "CJuego", "EKBallDetected", "ballDetected");
// }



// void CJuego::ballDetected(){

//   std::cout << "Entre a ballDetected" << std::endl << std::flush;
//   qiLogInfo("CJuego") << "logVeoAlgo" << std::endl;

//    AL::ALCriticalSection section(fCallbackMutex);
//   fStateGK =  fMemoryProxy.getData("EKBallDetected");
  
//   fMotionProxy.setAngles("Head", fStateGK[1], 0.4);
//   //fMotionProxy.setWalkTargetVelocity(0, fStateGK[2][2], 0, 0.1);

//   if((float)fStateGK[0] < 65)
//   {
//     std::cout << "Theta: " << (float)fStateGK[2][2] << std::endl;
//     if ((float)fStateGK[2][2] > 0.35)
//     {
//       caidader();
//     }
//     else if((float)fStateGK[2][2] < -0.35)
//     {
//       caidaizq();
//     }

// 	return;	
// }
// }

void CJuego::play()
{

  std::cout << "Entre a Play" << std::endl << std::flush;

  // Find your library
std::string filename = qi::path::findLib("/home/nao/libshooter.so");
// Open your library
void* handle = qi::os::dlopen(filename.c_str());
if (!handle)
{
  // Log the last message comming form dynamic linking function
  qiLogWarning("/home/nao/libshooter") << "Could not load library:"
                           << qi::os::dlerror() << std::endl;
  //return -1;
}else{
  std::cout << "Entre al Else" << std::endl << std::flush;
  qi::os::system("/home/nao/libshooter.so");
  std::cout << "Pase el qi os" << std::endl << std::flush;
}

// myFunc fun;
// // Find the symbole you want to use
// fun = (myFunc)qi::os::dlsym(handle, "my_function");
// if (!fun)
// {
//   qiLogWarning("libshooter") << "Could not find my_function method in plugin"
//                            << std::endl;
//   return -1;
// }

// // Use your function
// bool res = fun(args);
// if (!res)
// {
//   qi::os::dlclose(handle);
//   return -1;
// }
  // Agregar codigo para el comportamiento en el estado play
//Portero
  //std::cout << "3" << std::endl << std::flush;
  //AL::ALModule::createModule<Goalkeeper>(broker_Global, "Goalkeeper");
  // fMotionProxy.setStiffnesses("Head", 0.7);
  // fMotionProxy.setStiffnesses("Body", 0.7);
  // fPostureProxy.goToPosture("StandInit", 0.5f);
  // std::cout << Modulename << std::endl << std::flush;
  // fMemoryProxy.subscribeToMicroEvent("EKBallDetected", Modulename, "EKBallDetected", "ballDetected");
  //std::cout << "Play" << std::endl << std::flush;
  //qiLogInfo("CJuego") << "logPlay" << std::endl;
  //caidader();
  //std::cout << "Ya me tire" << std::endl << std::flush;
  //qiLogInfo("CJuego") << "logmeTire" << std::endl;
}
//----------------------------------------------------------------------------------

void CJuego::finish()
{
	// En el estado finish se detiene

	return;
}


