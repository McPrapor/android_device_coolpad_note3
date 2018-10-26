// For RTLD_NEXT
#define _GNU_SOURCE
// For dlsym
#include <dlfcn.h>
#include <stdlib.h>


#include <log/log.h>
#include <cutils/log.h>




#include <telephony/ril.h>

#define SHIMDEBUG 1


typedef enum {
    RIL_DEFAULT,
    RIL_SIM,
    RIL_STK,
    RIL_CC,
    RIL_SS,
    RIL_SMS,
    RIL_DATA,
    RIL_NW,
    RIL_OEM,
#ifdef MTK_MUX_CHANNEL_64
    RIL_RT,
    RIL_NRT,
    RIL_RADIO,
    RIL_DATA2,
    RIL_SIM2,
#endif
    RIL_SUPPORT_SUBSYSTEMS
} RILSubSystemId;

void (*real_bootupGetImei)(RILSubSystemId subsystem, RIL_SOCKET_ID rid) = NULL;

void (*real_switchStkUtkModeByCardType)(RIL_SOCKET_ID rid) = NULL;
static void (*real_handleCardTypeUrc)(const char *s, RIL_SOCKET_ID rid) = NULL;
void (*real_RIL_requestProxyTimedCallback) (RIL_TimedCallback callback, void *param, const struct timeval *relativeTime, int proxyId) = NULL;
void (*real_setupOpProperty)(RIL_SOCKET_ID rid) = NULL;
void (*real_setupDynamicSBP)(RIL_SOCKET_ID rid) = NULL;
void (*real_setSimInsertedStatus)(RIL_SOCKET_ID rid, int isInserted) = NULL;

void __attribute__((constructor)) initialize(void) {
    RLOGD("SHIM attribute constructor initialize called");
}


extern void bootupGetImei(RILSubSystemId subsystem, RIL_SOCKET_ID rid) {
  RLOGD("SHIM bootupGetImei called");
  real_bootupGetImei = dlsym(RTLD_NEXT, "bootupGetImei");
  if (real_bootupGetImei == NULL) {
#ifdef SHIMDEBUG
    RLOGD("SHIM real_bootupGetImei not found");
#endif
  }
#ifdef SHIMDEBUG      
    RLOGD("SHIM bootupGetImei call rid: %d", rid);
#endif
    if (real_bootupGetImei == NULL) {
#ifdef SHIMDEBUG          
      RLOGD("SHIM real_bootupGetImei found, calling...");
#endif      
      return real_bootupGetImei(subsystem, rid);
    }
}


void switchStkUtkModeByCardType(RIL_SOCKET_ID rid) {
  real_switchStkUtkModeByCardType = dlsym(RTLD_NEXT, "switchStkUtkModeByCardType");
  if (real_switchStkUtkModeByCardType == NULL) {
#ifdef SHIMDEBUG
    RLOGD("SHIM real_switchStkUtkModeByCardType not found");
#endif
  }
#ifdef SHIMDEBUG      
    RLOGD("SHIM switchStkUtkModeByCardType call rid: %d", rid);
#endif
    if (real_switchStkUtkModeByCardType == NULL) {
#ifdef SHIMDEBUG          
      RLOGD("SHIM real_switchStkUtkModeByCardType found, calling...");
#endif      
      return real_switchStkUtkModeByCardType(rid);
    }
}

static void handleCardTypeUrc(const char *s, RIL_SOCKET_ID rid) {
  real_handleCardTypeUrc = dlsym(RTLD_NEXT, "handleCardTypeUrc");
  if (real_handleCardTypeUrc == NULL) {
#ifdef SHIMDEBUG    
    RLOGD("SHIM real_handleCardTypeUrc not found");
#endif    
  }
  
#ifdef SHIMDEBUG    
    RLOGD("SHIM handleCardTypeUrc call rid: %d", rid);
#endif
    if (real_handleCardTypeUrc != NULL) {
#ifdef SHIMDEBUG          
        RLOGD("SHIM real_handleCardTypeUrc found, calling...");
#endif      
        return real_handleCardTypeUrc(s, rid);
    }
}

void RIL_requestProxyTimedCallback (RIL_TimedCallback callback, 
                                     void *param, const struct timeval *relativeTime, int proxyId) {
  real_RIL_requestProxyTimedCallback = dlsym(RTLD_NEXT, "RIL_requestProxyTimedCallback");
  if (real_RIL_requestProxyTimedCallback == NULL) {
#ifdef SHIMDEBUG    
    RLOGD("SHIM real_RIL_requestProxyTimedCallback not found");
#endif    
  }
#ifdef SHIMDEBUG    
    RLOGD("SHIM RIL_requestProxyTimedCallback call");
#endif
    if (real_RIL_requestProxyTimedCallback != NULL) {
#ifdef SHIMDEBUG          
        RLOGD("SHIM real_RIL_requestProxyTimedCallback found, calling...");
#endif      
        return real_RIL_requestProxyTimedCallback(callback, param, relativeTime, proxyId);
    }  
}

void setupOpProperty(RIL_SOCKET_ID rid){
  real_setupOpProperty = dlsym(RTLD_NEXT, "setupOpProperty");
  if (real_setupOpProperty == NULL) {
#ifdef SHIMDEBUG    
    RLOGD("SHIM real_setupOpProperty not found");
#endif    
  }  
#ifdef SHIMDEBUG    
    RLOGD("SHIM setupOpProperty call rid: %d", rid);
#endif
    if (real_setupOpProperty != NULL) {
#ifdef SHIMDEBUG          
        RLOGD("SHIM real_setupOpProperty found, calling...");
#endif      
        return real_setupOpProperty(rid);
    }     
}

void setupDynamicSBP(RIL_SOCKET_ID rid){
  real_setupDynamicSBP = dlsym(RTLD_NEXT, "setupDynamicSBP");
  if (real_setupDynamicSBP == NULL) {
#ifdef SHIMDEBUG    
    RLOGD("SHIM real_setupDynamicSBP not found");
#endif    
  } 
#ifdef SHIMDEBUG    
    RLOGD("SHIM setupDynamicSBP call rid: %d", rid);
#endif
    if (real_setupDynamicSBP != NULL) {
#ifdef SHIMDEBUG          
        RLOGD("SHIM real_setupDynamicSBP found, calling...");
#endif      
        return real_setupDynamicSBP(rid);
    }  
}  

void setSimInsertedStatus(RIL_SOCKET_ID rid, int isInserted){
  real_setSimInsertedStatus = dlsym(RTLD_NEXT, "setSimInsertedStatus");
  if (real_setSimInsertedStatus == NULL) {
#ifdef SHIMDEBUG    
    RLOGD("SHIM real_setSimInsertedStatus not found");
#endif    
  } 
#ifdef SHIMDEBUG    
    RLOGD("SHIM setSimInsertedStatus call rid: %d isInserted: %d", rid, isInserted);
#endif
    if (real_setSimInsertedStatus != NULL) {
#ifdef SHIMDEBUG          
        RLOGD("SHIM real_setSimInsertedStatus found, calling...");
#endif      
        return real_setSimInsertedStatus(rid, isInserted);
    }  
}
