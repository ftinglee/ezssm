package ezbase.core.utils;

import java.nio.ByteBuffer;
import java.util.UUID;
import org.apache.commons.codec.binary.Base64;

/**
 * <p>对128-bit uuid重新进行Base64编码,生成Base64格式的UUID 22位</p>
 * @version 1.0
 **/
public class UuidUtil {

    public static String uuidFromBase64(String str) {
        byte[] bytes = Base64.decodeBase64(str);
        ByteBuffer bb = ByteBuffer.wrap(bytes);
        UUID uuid = new UUID(bb.getLong(), bb.getLong());
        return uuid.toString();
    }

    /**
     * uuid使用base64压缩,生成长度为22的唯一值
     * @return ID
     */
    public static String generateId(){
        UUID uuid = UUID.randomUUID();
        ByteBuffer bb = ByteBuffer.wrap(new byte[16]);
        bb.putLong(uuid.getMostSignificantBits());
        bb.putLong(uuid.getLeastSignificantBits());
        return Base64.encodeBase64URLSafeString(bb.array());
    }

    /**
     * uuid使用base64压缩,生成长度为22的唯一值
     * @return ID
     */
    public static String generateSalt(){
        UUID uuid = UUID.randomUUID();
        ByteBuffer bb = ByteBuffer.wrap(new byte[8]);
        bb.putLong(uuid.getMostSignificantBits());
        return Base64.encodeBase64URLSafeString(bb.array());
    }


    public static void main(String[] args){
        System.out.println(generateId());
    }
}
