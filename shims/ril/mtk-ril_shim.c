#include <log/log.h>
#include <cutils/log.h>

#define SHIMDEBUG 1

void (*real_switchStkUtkModeByCardType)(double rid) = NULL;
static void (*real_handleCardTypeUrc)(const char *s, RIL_SOCKET_ID rid) = NULL;

void __attribute__((constructor)) initialize(void) {
  real_switchStkUtkModeByCardType = dlsym(RTLD_NEXT, "switchStkUtkModeByCardType");
  if (real_switchStkUtkModeByCardType == NULL) {
#ifdef SHIMDEBUG
    RLOGD("SHIM real_switchStkUtkModeByCardType not found");
#endif
  }
  real_fopen = dlsym(RTLD_NEXT, "handleCardTypeUrc");
  if (real_handleCardTypeUrc == NULL) {
#ifdef SHIMDEBUG    
    RLOGD("SHIM real_handleCardTypeUrc not found");
#endif    
  }
}

void switchStkUtkModeByCardType(double rid) {
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
