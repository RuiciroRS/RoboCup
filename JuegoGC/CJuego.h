#ifndef CJUEGO_H
#define CJUEGO_H

#include <boost/shared_ptr.hpp>
#include <alcommon/almodule.h>
#include <string>

//socket includes
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <arpa/inet.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <fcntl.h>
#include <errno.h>
#include <time.h>

#include <alproxies/alredballtrackerproxy.h>
#include <alproxies/almemoryproxy.h>
#include <alproxies/altexttospeechproxy.h>
#include <alproxies/alledsproxy.h>
#include <althread/almutex.h>
#include <alproxies/almotionproxy.h>
#include <alproxies/alrobotpostureproxy.h>
# include <alproxies/alframemanagerproxy.h>

#include "RoboCupGameControlData.h"
#include "SPLStandardMessage.h"

// Opencv includes.
#include <opencv2/core/core.hpp>
#include <opencv2/highgui/highgui.hpp>

// Aldebaran includes.
#include <alproxies/alvideodeviceproxy.h>
#include <alvision/alimage.h>
#include <alvision/alvisiondefinitions.h>
#include <alerror/alerror.h>

#define DELANTERO             0
#define DEFENSA               1
#define PERTERO               2

namespace AL
{
  class ALBroker;
}

class CJuego : public AL::ALModule
{
  public:

    CJuego(boost::shared_ptr<AL::ALBroker> broker, const std::string& name);

    virtual ~CJuego();

    /** Overloading ALModule::init().
    * This is called right after the module has been loaded
    */
    virtual void init();

    /**
    * This method will be called every time the robot fallen.
    */
    void onRobotFallen();

    void ChestButtonPressed();

  private:
    AL::ALMemoryProxy fMemoryProxy;
    AL::ALTextToSpeechProxy fTtsProxy;
    AL::ALLedsProxy fLedsProxy;
    AL::ALMotionProxy fMotionProxy;
    AL::ALRobotPostureProxy fRobotPostureProxy;
    AL::ALVideoDeviceProxy fcamProxy;
    AL::ALValue fStateGK;
    AL::ALRobotPostureProxy fPostureProxy;
    AL::ALFrameManagerProxy fFrameManagerProxy;
    //AL::ALRedBallTrackerProxy fballTracker;

    RoboCupGameControlData mGCData;
    SPLStandardMessage mStdMessage;
    int mhSocket;
    unsigned short mPort;
    struct sockaddr_in mAddress;
    int mColor;
    int mTeam;
    int mState;
    int mpreviousState;
    int mCounter;

    int mComportamiento;
    boost::shared_ptr<AL::ALMutex> fCallbackMutex;

    float fState;

    void acciones();
    void ready();
    void set();
    void play();
    void finish();
    void caidaizq();
    void caidader();
    void ballDetected();
    void buildStdMessage(int intention, int distPel);

    float mxPel;
    float myPel;
    bool mbPel;
    bool bTracking;
    bool bTirando;
    bool bPenalized;
    int mCountLost;

    time_t mCurrentTime;
    time_t mLastTime;

   //Walktotarget
    bool bMustStop;
    float xTarget;
    std::vector<float> firstRobotPositionTheta;
    
};

#endif  // CJUEGO_H
