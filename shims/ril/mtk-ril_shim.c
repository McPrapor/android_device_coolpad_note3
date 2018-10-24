#include <log/log.h>
#include <cutils/log.h>

void (*real_switchStkUtkModeByCardType)(double rid) = NULL;
static void (*real_handleCardTypeUrc)(const char *s, RIL_SOCKET_ID rid) = NULL;

void __attribute__((constructor)) initialize(void) {
  real_switchStkUtkModeByCardType = dlsym(RTLD_NEXT, "switchStkUtkModeByCardType");
  if (real_switchStkUtkModeByCardType == NULL) {
    RLOGD("real_switchStkUtkModeByCardType not found");
  }
  real_fopen = dlsym(RTLD_NEXT, "handleCardTypeUrc");
  if (real_handleCardTypeUrc == NULL) {
    RLOGD("real_handleCardTypeUrc not found");
  }
}

void switchStkUtkModeByCardType(double rid) {
    RLOGD("switchStkUtkModeByCardType SHIM call rid: %d", rid);
    if (real_switchStkUtkModeByCardType == NULL) {
      RLOGD("real_switchStkUtkModeByCardType found, calling...");
      return real_switchStkUtkModeByCardType(rid);
    }
}


static void handleCardTypeUrc(const char *s, RIL_SOCKET_ID rid) {
    RLOGD("handleCardTypeUrc SHIM call rid: %d", rid);
    if (real_handleCardTypeUrc != NULL) {
        RLOGD("real_handleCardTypeUrc found, calling...");
        return real_handleCardTypeUrc(s, rid);
    }
}
