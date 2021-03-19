package utils;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStreamReader;

public class ToString {
        public static String readCityFile(File file) {
        FileInputStream is = null;
        StringBuilder stringBuilder = null;
        try {
            if (file.length() != 0) {
                /**
                 * 文件有内容才去读文件
                 */
                is = new FileInputStream(file);
                InputStreamReader streamReader = new InputStreamReader(is);
                BufferedReader reader = new BufferedReader(streamReader);
                String line;
                stringBuilder = new StringBuilder();
                while ((line = reader.readLine()) != null) {
                    // stringBuilder.append(line);
                    stringBuilder.append(line);
                }
                reader.close();
                is.close();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return String.valueOf(stringBuilder);

    }
}
