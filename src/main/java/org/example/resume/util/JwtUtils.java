package org.example.resume.util;

import io.jsonwebtoken.*;
import io.jsonwebtoken.security.Keys;
import io.jsonwebtoken.security.SecurityException;

import java.security.Key;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

/**
 * JWT 工具类（线程安全）
 */
public class JwtUtils {

    // 常量: 加密用的密钥 (盐值) >= 256位的随机字符串
    private static final String SECRET_KEY = "abcdefgabcdefgabcdefgabcdefgabcdefgabcdefgabcdefgabcdefgabcdefgabcdefgabcdefgabcdefgabcdefgabcdefgabcdefgabcdefgabcdefgabcdefgabcdefgabcdefgabcdefgabcdefgabcdefgabcdefgabcdefgabcdefgabcdefgabcdefgabcdefgabcdefgabcdefgabcdefgabcdefgabcdefgabcdefgabcdefgabcdefgabcdefgabcdefgabcdefgabcdefgabcdefgabcdefgabcdefgabcdefgabcdefgabcdefgabcdefg";
    // 常量: 自定义短期令牌过期时间
    private static final long ACCESS_TOKEN_EXPIRE = 15 * 60 * 1000; // 15分钟（单位：毫秒）
    // 常量: 自定义长期令牌过期时间
    private static final long REFRESH_TOKEN_EXPIRE = 7 * 24 * 60 * 60 * 1000; // 7天

    // 生成签名密钥（HMAC-SHA256）
    private static Key getSigningKey() {
        return Keys.hmacShaKeyFor(SECRET_KEY.getBytes());
    }

    /**
     * 生成 Access Token（短期令牌）
     * @param claims 自定义负载（如用户ID、角色）
     */
    public static String generateAccessToken(Map<String, Object> claims) {
        return Jwts.builder()
                .setClaims(claims)
                .setIssuedAt(new Date())
                .setExpiration(new Date(System.currentTimeMillis() + ACCESS_TOKEN_EXPIRE))
                .signWith(getSigningKey(), SignatureAlgorithm.HS256)
                .compact();
    }

    /**
     * 生成 Refresh Token（长期令牌，仅含必要信息）
     * @param userId 用户唯一标识
     */
    public static String generateRefreshToken(String userId) {
        return Jwts.builder()
                .setSubject(userId)
                .setIssuedAt(new Date())
                .setExpiration(new Date(System.currentTimeMillis() + REFRESH_TOKEN_EXPIRE))
                .signWith(getSigningKey(), SignatureAlgorithm.HS256)
                .compact();
    }

    /**
     * 解析 Token 获取负载
     * @throws ExpiredJwtException 令牌过期
     * @throws MalformedJwtException 令牌格式错误
     * @throws SecurityException 签名不匹配
     */
    public static Claims parseToken(String token) {
        return Jwts.parserBuilder()
                .setSigningKey(getSigningKey())
                .build()
                .parseClaimsJws(token)
                .getBody();
    }

    /**
     * 验证 Token 是否有效
     * @return true=有效，false=无效或过期
     */
    public static boolean validateToken(String token) {
        try {
            parseToken(token);
            return true;
        } catch (ExpiredJwtException | UnsupportedJwtException
                 | MalformedJwtException | IllegalArgumentException e) {
            e.printStackTrace();
            // 日志记录异常（实际项目需处理）
            return false;
        }
    }

    /**
     * 刷新 Access Token（基于未过期的 Refresh Token）
     * @param refreshToken 刷新令牌
     * @return 新的 Access Token
     */
    public static String refreshAccessToken(String refreshToken) {
        Claims claims = parseToken(refreshToken);
        Map<String, Object> newClaims = new HashMap<>();
        newClaims.put("userId", claims.getSubject()); // 从Refresh Token提取用户ID
        // 可添加其他必要字段
        return generateAccessToken(newClaims);
    }

    // 测试示例
    public static void main(String[] args) {
        // 创建一个HashMap, 把要存储放令牌中的数据, 放入HashMap
        Map<String, Object> claims = new HashMap<>();
        claims.put("userId", "1001");
        claims.put("username", "张飞");
        claims.put("role", "admin");

        // 生成一个短期令牌
        String accessToken = generateAccessToken(claims);
        // 生成一个长期令牌
        String refreshToken = generateRefreshToken("1001");
        // 打印令牌
        System.out.println("Access Token: " + accessToken);
        System.out.println("Refresh Token: " + refreshToken);

//        // 验证并解析
//        if (validateToken(accessToken)) {
//            Claims parsed = parseToken(accessToken);
//            System.out.println("用户ID: " + parsed.get("userId"));
//            System.out.println("过期时间: " + parsed.getExpiration());
//        }
    }
}