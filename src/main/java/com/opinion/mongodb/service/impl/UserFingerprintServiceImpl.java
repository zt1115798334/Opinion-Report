package com.opinion.mongodb.service.impl;

import com.opinion.mongodb.entity.UserFingerprint;
import com.opinion.mongodb.repository.UserFingerprintRepository;
import com.opinion.mongodb.service.UserFingerprintService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import zk.jni.JavaToBiokey;

/**
 * @author zhangtong
 * Created by on 2017/12/15
 */
@Service
public class UserFingerprintServiceImpl implements UserFingerprintService {

    @Autowired
    private UserFingerprintRepository userFingerprintRepository;

    @Override
    public UserFingerprint save(UserFingerprint userFingerprint) {
        this.deleteByUserId(userFingerprint.getUserId());
        return userFingerprintRepository.save(userFingerprint);
    }

    @Override
    public UserFingerprint saveDefault() {
        UserFingerprint userFingerprint = this.findByUserId(1L);
        if(userFingerprint==null){
            userFingerprint = new UserFingerprint(1L,
                    "TIJTUzIxAAAFwcIECAUHCc7QAAAZwG8BAAAAhWw4icHuAFgMhQA4AG7NXgDvAOIOowAFwJgNtgDzAJ0PWMESAZYPRwA4AB/MpgCIAAUPrwB7wecPOgAgAW4OsMF6AAQPNwBWANzNRwA6AZQOkwBOwHIOkgBdACEEAsD+AEANEAEqADzMJgBNAZYPlwA6weUMgwDvABoLhcG3AOcPWwAkAMrPWADCANQPBQDWwR4PVwCsAIoPQsGnAFMPrQDwAVnN5wD4AEUPCAAjwFULHQDfAIwPgMFtAOoNIgBiAFHOzgB9AAoPBQBOwNYPCwHGAGcPC8D7ALoNwwCXAAPOzQBAAAUOtgDgwdkNoAD4AJ8Mt8HfAB0PVgAgACXPeQAXAW0NWgAlwF0MNgD+APgNNsEMAcAL4gDHAbrOaABAAekPYwBxwfYJIgAFAfMN8MG8ACYP7QBSAB3O0QBGAVgP0QAvwLAICQAtAWABWcFHAGQNqHq47DzD0IzpFA0ThcdQ1dBJmbk5Bcgv5PygAvY5vf00K4u95NzNX1E7mAE80HP+hvzvmUYFjCwEG5JxDQwYAYQ+zIoJh8aOyCKYKvet+Y6x4krc/DzD7LvgKIrQCc88kYOd+QaaEwWTJ4/ztIPPA37/pUvcdDkJDhbjm+LRFbLl7Ln6rIbvxVeAxQWuyQbExD1sfs56PQQUflNBzAJJhxYJSYtDxD+Oavye+b9+d9dfDmeJdQnHBKc0DH8uATMFPAuTN+8GnYBNf7+GaL8bah/pLH5Jg0+3TAHKB7L/FAG+Ps4DwfkV+vQKvMccBqHzSQFYxbsFRVKEQ7kLXNvsxrjXTQLmBmvyiL1AJLUJiYSQjfTUkX++gRpvxHonlGd/nfTJ9esUWLg8+W6NaYbXEoIvo/YGEpN6WIDjxb/+RA/GClt+1Tb/E7NwtIP6flJCT2QOwiW0aSBGwAP8KDgHAFAYaAHAw/3/BABYIHW5BQBwIWRswACr42z/XQwAYOZpxgFGwYXBDgB6J38F/MJ5UWcbxcwou3/BhcFkwjt6xaGInR0A1Da4hZaba1LBhP9wAZsLwWo+Ymv/iwX/+wLBCgBwQVo6U4k8MQDHQXfBOsHBA/9ywUXCgbTCxATFwMd5wVg7/vM6/Pz9wP/COMD4xQE3QmZwCsVNQaHB/3fATwTFz0HHWAwAWEdiBcFjAEXDBADGU8ZSDMH4VInAecAEwwzB8mGGwf3CV8IBwYxjZl0XAD5qg4aWbW9+d8CzHgU+c4ZKwsN7rIR5RcHDw8fHwTrDD8GpdPfAKMIF/PrGAdJ8DMH/OjcNwbd9A/9DONQBCmSfwsT9wcEFkcQAwcPCwAwAb4gF9/3B/zD/GcQXi1aKan/DwMBUwHoCw8TIBgDwXRbFPC0IAB+nWgdmhssBR6lXwsGjghTBJapTaMNnB8LBA2fEBwBWrpXAxz7F/hcAgrgb/fg+K/3B/sD+Ov7HPP//wP5BEMXxvF3AhJLCw8IFwcUABgD5vyAw8gQFNMAkOBUBDQGmgbTBkMTBhMAHrxfACcakfoOMV3fHwgAQzC3/BcXE1t3/JAwAt9zW/PjlUEYNABvhhk7BAcLDwcXAwdIAcSXWPf39//w7//s+///A/f7AOv9I1QGC6tf+/zr8+Twv/jD/NcDfAGAs3cP///0uOvwqP/7+/j3+TAUKBUTv4MD//v0+/S/IABLvOkf9BEAMwbXwT8Arwe8YBaTy9MTDQf3h/vo8wf/9////Ov/6Pw0AuvVG/jjBQT/8TAYAhPml/fvWEQCM+tf/O/35OP/9/v/9OwUJBV76XMDBNh3NAO09QUv+WwMQgwA0BwYRBwA9OPsHFfsAParIwAjV4QKCwSpZBRAizzfEBMIIEJ4iXAT9+vAEEMwnUEzNEAXrH23ChgUR3ixDP0UEEAA0HqgEFWw2WjgUEGz55sW/wML99vb6OP/6P8D//sAEEd5CVQP8");
            userFingerprintRepository.save(userFingerprint);
        }
        return null;
    }

    @Override
    public UserFingerprint findByUserId(Long userId) {
        return userFingerprintRepository.findByUserId(userId);
    }

    @Override
    public boolean deleteByUserId(Long userId) {
        userFingerprintRepository.deleteByUserId(userId);
        return false;
    }

    @Override
    public boolean verificationFingerprint(Long userId, String fingerprint) {
        UserFingerprint userFingerprint = this.findByUserId(userId);
        String reg = "mspY1o6mpgltAQiMDjZBB2mOVMIGCJBjAQWDkTRCBuIVZ0EJHJYqwQZoF2nBB40YNIIJZRpNQgt1oX2BBiChT8IWEiJYgg0bJnKBBiapMsELTy1hAgwvLnHBCC0vSEExODIoQQdMNDDBB0e2NsIIPTdEgSW0t0bBJL24cUEIMzhmwQ1FOUdBHmU5P8EvuDo8ASmyPGtBE0s9OwEd2z0mwQXDvoQCDDHBNgET2cFxQnc5wXxCHZpCL4IOyEN5gh1+SHhBTGnLKgEL1EtEgQPZUlRCBdRAVMsRr1BQHAMSUVNTU1ZhDR0mKSopJSMiIQMSUFBOTEtFMysvMC4tKSckJAMRVVZXWF1nAhUfIiUlIyMiAxNMTUtGQz87ODg2NDEsKSUlIgMRWVtcXmFqdg0XHCAiISEhAxNLSkdDQkNEQj87NzItKSYnJwMRX19hY2dtdgkQFhodHyAgAxNJSUhHS1BRTUhCOjMrKCQlIgQRZGZpbHEBBw4UGBscHR0DE0tLS1FYXVtXUktAMiQjIiQiBBBoaWxwdAIIDRIWGRscAxJQUFNYXV9dXFhWVDcaHRwgBBBoa21xdQMHDBAVGBobBBFUWFxfYF5eXFxhbQULBgQPaWxvcnYDBwsPExcaBBFZXV9gYF9eXV9iZm50cwUPbm9zdwQHCw8TFxsEEl1hYmJgXl5dXV9gYWdnaQYOcXR3BQgKDhEXBRFlZWNhX19eX2FgYmRjBw10AQYICw8RBhBnY2FfX15cXlxeXBjwMxm0qlAUIdEpxoHM/3yFVRjqjGWGC5QiDAUyDTjyIsNcu+jaTw83LB1wgCOdS+C3rKIgXACWPSVNC+Qed1knAK47O3XxTwUiLOWs40N8kl7txd5EtQ86Ifa/4CJYEZ2YQnvvnnmpKunFCTlIlwJhe3FAGb6Jit4F4UghJ/WtoJz1Y6GJNT3ZooaBs3bzRIj1YhTvaee46bYvxzIhpQpzxZUaNGDHHaKe7C7a8DTSLadWhQ56ujdO2K63C0KV71D/rYG/PcDOwlM2H2z7hwfgJvtCirZ6fHaLK8IfUoauQUsIi+Mk1m7jJZ08QfhYfWqCYg3/vR1bO5l3SmnxntfjShb6IMbriVRC4IH9wuGKICXvQzpzCZV8cP9GOrBV0XWFdZQC7xJen9ZsXDijOHcYGBgYGBgYGBgYGBgYGBgYGBgYGBgYGBgY";// "REGSTR";
        String ver = "mspYlpG2qAdaAguNjHKBFY8NS4EJEBB3ghGdljOBBm8WaoEIkRd6QQcgmTLBBewZUMIHEZtewgSKoSyBDWkkREINeiRiQgWVqUuBDoOqUIEKHa9yAQYlsidBDFKzZUEGKjkfQglQuTtBJD65U8EKOLoTARXJu2IBCDG8I8EKTD8qQglCv4iBE6FBNgErusE4QSu/QjLBO7bDLkE0tEQ6QRZlxFaBDklEYoEHNkQZwQXExSzBJODIWoETT8kmgRbeySDCEcxJdsEGn0xqQRWkzWCCbT5PUYENcFBnQhuD0E6BCGLRdgETikO07Q6ycPMXAxFgYWNpcQYTGR0gISIhISECEVhcXF5lcQobISQlJSQiIiMDEWNkaG11Bg8WGh0fIB8fHQIRVFZXWGBxFSInKisoJSQjJgMRZWltcncHDxQYGx0dHx0fAhFQUlJRUj4pKy4tLSonJSUpBBBscHQCBw8TFxocHR0dAhFMTktIRD44NjUyMCwoJicrBBBvcXQCBw0SFRkcHR8gAhFLTEdEQkE/PTk2My8sKCgqBBBucXQCBw4RFRgbHB8hAhFNTUpKTE5KRD85NTAtKSgpBRBydAEFDREVFxwdISECEVBQU1ZdXFZPRj42MCwoJycFD3N0dwQMDxQWGx0jAhBSVVtgY2BdVk8/MiglIiMGDnJ2AwoQFhgbHQIQWF5hY2NhYFxbUSQgHRwfBw51AgkQFhcYGgMQYmNlZWNiX2FrBRQUFBUIDQIJExgZGQQPZ2dlY2JhZGl1Cw8NGPACGbSqUBQh0SrOMS9lRQeSZl3DX1bRn8Pppxb2h01LIkrB6I3eGvzcTzWMpXuDQVXbMyvL6hic1u0P8FZUTvY4GjPt9nFMk37V4eLKV1JWgNSi31RcYAlAytXsz4LS8qm+7RQjXgUpwBAtqly2ZU+DCKAlWrjKcmUrnWEqNZ6ofqk2JrrSomNNUS8DLZKyU1kk6FILgv9eK7feykWNmwwApDMnZ8KB4Mpi+7jy5mP5Bef6OGLgtYXAq7rSlIEt4gKlFSLRrwEYs/uEK4gwDN49Vu6TzvUC6e6HvHovljRs2U5JY4yGhdKeAdexOQB7J1VK1vRhnaUpNV+eX97AzsvYiVoLHfkUQAuqjo+/jOccGTpOcKB+HLcYtCooyHcYGBgYGBgYGBgYGBgYGBgYGBgYGBgYGBgYGBgYGBgYGBgYGBgYGBgYGBg=";// "VERSTR";
        if (userFingerprint != null) {
            return JavaToBiokey.NativeToProcess(fingerprint, userFingerprint.getFingerprint());
//            return JavaToBiokey.NativeToProcess(reg, ver);
        } else {
            return false;
        }
    }
}
