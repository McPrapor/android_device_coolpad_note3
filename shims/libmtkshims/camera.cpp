extern "C" {
/*    
    int ion_alloc_camera_pool() {
        return 0;   
    }
    int _ZN5NSCam23IGraphicImageBufferHeap6createEPKcPN7android13GraphicBufferEii(){
        return 0;
    }
    int _Z9SmoothCCMRK10AWB_GAIN_TiiR26ISP_NVRAM_MULTI_CCM_STRUCTRN11NSIspTuning15ISP_NVRAM_CCM_TER16ISP_CCM_WEIGHT_Tii(){
        return 0;
    }
    int _Z9SmoothCFAjjjRKN11NSIspTuning15ISP_NVRAM_CFA_TES2_RS0_(){
           return 0;
    }
    int _Z8SmoothEEjjjRKN11NSIspTuning14ISP_NVRAM_EE_TES2_RS0_(){
            return 0;   
    }
    int _Z9SmoothANRjjjRKN11NSIspTuning15ISP_NVRAM_ANR_TES2_RS0_(){
            return 0;
    }

    int _ZN9IHalFlash11getInstanceEi() {
        return 0;   
    }
*/

    int _ZN12DpBlitStream10invalidateEP7timeval();
    int _ZN12DpBlitStream10invalidateEv() {
        return _ZN12DpBlitStream10invalidateEP7timeval();
    }

    int _ZN11DpIspStream11startStreamEP7timeval();
    int _ZN11DpIspStream11startStreamEv() {
        return _ZN11DpIspStream11startStreamEP7timeval();
    }

    int _ZN11DpIspStream15dequeueFrameEndEPj();
    int _ZN11DpIspStream15dequeueFrameEndEv() {
        return _ZN11DpIspStream15dequeueFrameEndEPj();
    }
}
