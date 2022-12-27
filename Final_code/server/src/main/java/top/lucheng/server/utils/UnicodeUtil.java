package top.lucheng.server.utils;

public class UnicodeUtil {
    public static String unicodeToStr(String string) {
        String prefix = "\\u";
        if (string == null || string.indexOf(prefix) < 0) {
            // 传入字符串为空或不包含 Unicode 编码返回原内容
            return string;
        }

        StringBuilder value = new StringBuilder(string.length() >> 2);
        String[] strings = string.split("\\\\u");
        String hex, mix;
        char hexChar;
        int ascii, n;

        if (strings[0].length() > 0) {
            // 处理开头的普通字符串
            value.append(strings[0]);
        }

        try {
            for (int i = 1; i < strings.length; i++) {
                hex = strings[i];
                if (hex.length() > 3) {
                    mix = "";
                    if (hex.length() > 4) {
                        // 处理 Unicode 编码符号后面的普通字符串
                        mix = hex.substring(4, hex.length());
                    }
                    hex = hex.substring(0, 4);

                    try {
                        Integer.parseInt(hex, 16);
                    } catch (Exception e) {
                        // 不能将当前 16 进制字符串正常转换为 10 进制数字，拼接原内容后跳出
                        value.append(prefix).append(strings[i]);
                        continue;
                    }

                    ascii = 0;
                    for (int j = 0; j < hex.length(); j++) {
                        hexChar = hex.charAt(j);
                        // 将 Unicode 编码中的 16 进制数字逐个转为 10 进制
                        n = Integer.parseInt(String.valueOf(hexChar), 16);
                        // 转换为 ASCII 码
                        ascii += n * ((int) Math.pow(16, (hex.length() - j - 1)));
                    }

                    // 拼接解码内容
                    value.append((char) ascii).append(mix);
                } else {
                    // 不转换特殊长度的 Unicode 编码
                    value.append(prefix).append(hex);
                }
            }
        } catch (Exception e) {
            // Unicode 编码格式有误，解码失败
            return null;
        }

        return value.toString();
    }
}
