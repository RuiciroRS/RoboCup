#include "Goalkeeper.h"

#include <alvalue/alvalue.h>
#include <alcommon/alproxy.h>
#include <alcommon/albroker.h>
#include <qi/log.hpp>
#include <althread/alcriticalsection.h>

#include <opencv2/core/core.hpp>
#include <opencv2/highgui/highgui.hpp>
#include "opencv2/opencv.hpp"

//Fue Penia
#include <iostream>
#include <qi/log.hpp>


std::string Modulename;


Goalkeeper::Goalkeeper(
  boost::shared_ptr<AL::ALBroker> broker,
  const std::string& name): AL::ALModule(broker, name),
    fCallbackMutex(AL::ALMutex::createALMutex())
{
  setModuleDescription("This module probe de Game Controler for SPL 2017.");
  functionName("ChestButtonPressed", getName(), "Method called when the chest button is pressed.");
  BIND_METHOD(Goalkeeper::ChestButtonPressed);
  functionName("onRobotFallen", getName(), "Method called when the robot fallen.");
  BIND_METHOD(Goalkeeper::onRobotFallen);
  functionName("ballDetected", getName(), "Guarda en variable");
  BIND_METHOD(Goalkeeper::ballDetected);


  std::cout << "constr Goalkeeper" << std::endl;
  Modulename = name;
  // //mComportamiento = DELANTERO;

  //       bTracking =  false;
  //       bMustStop = false;
  
  // bTirando = false;
  // bPenalized = false;
  // mCountLost = 0;

  std::cout << "Intancia Goalkeeper creada" << name << std::endl << std::flush;
}
void Goalkeeper::init(){
  try{
  fMotionProxy.setStiffnesses("Head", 0.7);
  fMotionProxy.setStiffnesses("Body", 0.7);
  fPostureProxy.goToPosture("StandInit", 0.5f);
  std::cout << Modulename << std::endl << std::flush;
  fMemoryProxy.subscribeToMicroEvent("EKBallDetected", Modulename, "EKBallDetected", "ballDetected");
      }catch (const AL::ALError& e) {
      qiLogError("module.example") << e.what() << std::endl;
    }
}


void Goalkeeper::caidaizq()
{
  std::string behaviorID;
  behaviorID = fFrameManagerProxy.newBehaviorFromFile("/home/nao/caida1.xar", "");
  fFrameManagerProxy.completeBehavior(behaviorID);
  std::cout << "Caida a la izquierda" << std::endl << std::flush;
  qiLogInfo("Goalkeeper") << "logcaidaIzq" << std::endl;
}

void Goalkeeper::caidader()
{
  std::string behaviorID;
  behaviorID = fFrameManagerProxy.newBehaviorFromFile("/home/nao/caida2.xar", "");
  fFrameManagerProxy.completeBehavior(behaviorID);
  std::cout << "Caida a la derecha" << std::endl << std::flush;
  qiLogInfo("Goalkeeper") << "logcaidaDer" << std::endl;
}

// void Goalkeeper::leftBumperPressed()
// {
//   fMotionProxy.setStiffnesses("Head", 0.7);
//   fMotionProxy.setStiffnesses("Body", 0.7);
//   fPostureProxy.goToPosture("StandInit", 0.5f);
//   fMemoryProxy.subscribeToMicroEvent("EKBallDetected", "Goalkeeper", "EKBallDetected", "ballDetected");
// }



void Goalkeeper::ballDetected(){

  std::cout << "Entre a ballDetected" << std::endl << std::flush;
  qiLogInfo("Goalkeeper") << "logVeoAlgo" << std::endl;

  AL::ALCriticalSection section(fCallbackMutex);
  fStateGK =  fMemoryProxy.getData("EKBallDetected");
  
  fMotionProxy.setAngles("Head", fStateGK[1], 0.4);
  //fMotionProxy.setWalkTargetVelocity(0, fStateGK[2][2], 0, 0.1);

  if((float)fStateGK[0] < 65)
  {
    std::cout << "Theta: " << (float)fStateGK[2][2] << std::endl;
    if ((float)fStateGK[2][2] > 0.35)
    {
      caidader();
    }
    else if((float)fStateGK[2][2] < -0.35)
    {
      caidaizq();
    }

	return;	
}

}