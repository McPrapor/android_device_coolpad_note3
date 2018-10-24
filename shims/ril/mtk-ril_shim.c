#include <log/log.h>
#include <cutils/log.h>

#define SHIMDEBUG 1

void (*real_switchStkUtkModeByCardType)(RIL_SOCKET_ID rid) = NULL;
static void (*real_handleCardTypeUrc)(const char *s, RIL_SOCKET_ID rid) = NULL;
extern void (*real_RIL_requestProxyTimedCallback) (RIL_TimedCallback callback, void *param, const struct timeval *relativeTime, int proxyId) = NULL;
extern void (*real_setupOpProperty)(RIL_SOCKET_ID rid) = NULL;
extern void (*real_setupDynamicSBP)(RIL_SOCKET_ID rid) = NULL;


void __attribute__((constructor)) initialize(void) {
  real_switchStkUtkModeByCardType = dlsym(RTLD_NEXT, "switchStkUtkModeByCardType");
  if (real_switchStkUtkModeByCardType == NULL) {
#ifdef SHIMDEBUG
    RLOGD("SHIM real_switchStkUtkModeByCardType not found");
#endif
  }
  real_handleCardTypeUrc = dlsym(RTLD_NEXT, "handleCardTypeUrc");
  if (real_handleCardTypeUrc == NULL) {
#ifdef SHIMDEBUG    
    RLOGD("SHIM real_handleCardTypeUrc not found");
#endif    
  }
  real_RIL_requestProxyTimedCallback = dlsym(RTLD_NEXT, "RIL_requestProxyTimedCallback");
  if (real_RIL_requestProxyTimedCallback == NULL) {
#ifdef SHIMDEBUG    
    RLOGD("SHIM real_RIL_requestProxyTimedCallback not found");
#endif    
  }
  
  real_setupOpProperty = dlsym(RTLD_NEXT, "setupOpProperty");
  if (real_setupOpProperty == NULL) {
#ifdef SHIMDEBUG    
    RLOGD("SHIM real_setupOpProperty not found");
#endif    
  }  
    
  real_setupDynamicSBP = dlsym(RTLD_NEXT, "setupDynamicSBP");
  if (real_setupDynamicSBP == NULL) {
#ifdef SHIMDEBUG    
    RLOGD("SHIM real_setupDynamicSBP not found");
#endif    
  }      
}

void switchStkUtkModeByCardType(RIL_SOCKET_ID rid) {
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
#ifdef SHIMDEBUG    
    RLOGD("SHIM RIL_requestProxyTimedCallback call rid: %d", rid);
#endif
    if (real_RIL_requestProxyTimedCallback != NULL) {
#ifdef SHIMDEBUG          
        RLOGD("SHIM real_RIL_requestProxyTimedCallback found, calling...");
#endif      
        return real_RIL_requestProxyTimedCallback(callback, param, relativeTime, proxyId);
    }  
}

void setupOpProperty(RIL_SOCKET_ID rid){
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
