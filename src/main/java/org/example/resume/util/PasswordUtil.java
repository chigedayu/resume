package org.example.resume.util;

import org.mindrot.jbcrypt.BCrypt;

public class PasswordUtil {
    /*
     * 加密用户密码
     * @param plainPassword 明文密码
     * @return 加密后的哈希密码
     */
    public static String hashPassword(String plainPassword) {
        // 自动生成盐值并哈希密码（默认log_rounds=10）
        return BCrypt.hashpw(plainPassword, BCrypt.gensalt());
    }
    public static boolean checkPassword(String plainPassword, String hashedPassword) {
        return BCrypt.checkpw(plainPassword, hashedPassword);
    }
}