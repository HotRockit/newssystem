package utils;

import org.wltea.analyzer.core.IKSegmenter;
import org.wltea.analyzer.core.Lexeme;

import java.io.IOException;
import java.io.Reader;
import java.io.StringReader;
import java.util.*;



/**
 * 
 * <p>Title:</p>
 * <p>Description: SimpleSummariser
 * </p>
 * @createDate：2013-8-26
 * @author xq
 * @version 1.0
 */
public class SimpleSummariserAlgorithm {

    /**
     * 
    * @Title: summarise
    * @Description: 文章摘要实现
    * @param @param input
    * @param @param numSentences
    * @param @return    
    * @return String   
    * @throws
     */
    public static String summarise(String input, int numSentences) {
        // get the frequency of each word in the input
        Map<String,Integer> wordFrequencies = segStr(input);

        // now create a set of the X most frequent words
        Set<String> mostFrequentWords = getMostFrequentWords(100, wordFrequencies).keySet();

        // break the input up into sentences
        // workingSentences is used for the analysis, but
        // actualSentences is used in the results so that the 
        // capitalisation will be correct.
        String[] workingSentences = getSentences(input.toLowerCase());
        String[] actualSentences = getSentences(input);

        // iterate over the most frequent words, and add the first sentence 
        // that includes each word to the result
        Set<String> outputSentences = new LinkedHashSet<String>();
        Iterator<String> it = mostFrequentWords.iterator();
        while (it.hasNext()) {
            String word = (String) it.next();
            for (int i = 0; i < workingSentences.length; i++) {
                if (workingSentences[i].indexOf(word) >= 0) {
                    outputSentences.add(actualSentences[i]);
                    break;
                }
                if (outputSentences.size() >= numSentences) {
                    break;
                }
            }
            if (outputSentences.size() >= numSentences) {
                break;
            }

        }

        List<String> reorderedOutputSentences = reorderSentences(outputSentences, input);

        StringBuffer result = new StringBuffer("");
        it = reorderedOutputSentences.iterator();
        while (it.hasNext()) {
            String sentence = (String) it.next();
            result.append(sentence);
            result.append("."); // This isn't always correct - perhaps it should be whatever symbol the sentence finished with
            if (it.hasNext()) {
                result.append(" ");
            }
        }

        return result.toString();
    }
    
    /**
     * 
    * @Title: reorderSentences
    * @Description: 将句子按顺序输出
    * @param @param outputSentences
    * @param @param input
    * @param @return    
    * @return List<String>   
    * @throws
     */
    private static List<String> reorderSentences(Set<String> outputSentences, final String input) {
        // reorder the sentences to the order they were in the 
        // original text
        ArrayList<String> result = new ArrayList<String>(outputSentences);

        Collections.sort(result, new Comparator<String>() {
            public int compare(String arg0, String arg1) {
                String sentence1 = (String) arg0;
                String sentence2 = (String) arg1;

                int indexOfSentence1 = input.indexOf(sentence1.trim());
                int indexOfSentence2 = input.indexOf(sentence2.trim());
                int result = indexOfSentence1 - indexOfSentence2;

                return result;
            }

        });
        return result;
    }
    
    /**
     * 
    * @Title: getMostFrequentWords
    * @Description: 对分词进行按数量排序,取出前num个
    * @param @param num
    * @param @param words
    * @param @return    
    * @return Map<String,Integer>   
    * @throws
     */
    public static Map<String, Integer> getMostFrequentWords(int num,Map<String, Integer> words){
        
        Map<String, Integer> keywords = new LinkedHashMap<String, Integer>();
        int count=0;
        // 词频统计
        List<Map.Entry<String, Integer>> info = new ArrayList<Map.Entry<String, Integer>>(words.entrySet());
        Collections.sort(info, new Comparator<Map.Entry<String, Integer>>() {
            public int compare(Map.Entry<String, Integer> obj1, Map.Entry<String, Integer> obj2) {
                return obj2.getValue() - obj1.getValue();
            }
        });
        
        // 高频词输出
        for (int j = 0; j < info.size(); j++) {
            // 词-->频
            if(info.get(j).getKey().length()>1){
                if(num>count){
                    keywords.put(info.get(j).getKey(), info.get(j).getValue());
                    count++;
                }else{
                    break;
                }
            }
        }
        return keywords;
    }
    
    
    /**
     * 
    * @Title: segStr
    * @Description: 返回LinkedHashMap的分词
    * @param @param content
    * @param @return    
    * @return Map<String,Integer>   
    * @throws
     */
    public static Map<String, Integer> segStr(String content){
        // 分词
        Reader input = new StringReader(content);
        // 智能分词关闭（对分词的精度影响很大）
        IKSegmenter iks = new IKSegmenter(input, true);
        Lexeme lexeme = null;
        Map<String, Integer> words = new LinkedHashMap<String, Integer>();
        try {
            while ((lexeme = iks.next()) != null) {
                if (words.containsKey(lexeme.getLexemeText())) {
                    words.put(lexeme.getLexemeText(), words.get(lexeme.getLexemeText()) + 1);
                } else {
                    words.put(lexeme.getLexemeText(), 1);
                }
            }
        }catch(IOException e) {
            e.printStackTrace();
        }
        return words;
    }
    
    /**
     * 
    * @Title: getSentences
    * @Description: 把段落按. ! ?分隔成句组
    * @param @param input
    * @param @return    
    * @return String[]   
    * @throws
     */
    public static String[] getSentences(String input) {
        if (input == null) {
            return new String[0];
        } else {
            // split on a ".", a "!", a "?" followed by a space or EOL
        	//"(\\.|!|\\?)+(\\s|\\z)"
            return input.split("(\\.|!|\\?|。)");
        }

    }
}
