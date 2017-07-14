#ifndef GOALKEEPER_H
#define GOALKEEPER_H


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
#include <alproxies/alframemanagerproxy.h>

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

class Goalkeeper : public AL::ALModule{
  public:

    Goalkeeper(boost::shared_ptr<AL::ALBroker> broker, const std::string& name);

    virtual ~Goalkeeper();
     virtual void init();
private:
void caidaizq();
void caidader();
void ballDetected();




};

#endif 