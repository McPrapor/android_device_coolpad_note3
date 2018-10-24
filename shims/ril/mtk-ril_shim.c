#include <log/log.h>
#include <cutils/log.h>

void switchStkUtkModeByCardType(double rid) {
    RLOGD("switchStkUtkModeByCardType SHIM call rid: %d", rid);
}


static void handleCardTypeUrc(const char *s, RIL_SOCKET_ID rid) {
    RLOGD("handleCardTypeUrc SHIM call rid: %d", rid);
}
