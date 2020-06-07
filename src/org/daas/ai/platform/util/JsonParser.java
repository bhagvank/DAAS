/**
 * 
 */
package org.daas.ai.platform.util;

import java.io.StringReader;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

/**
 * @author bhagvan.kommadi
 *
 */
import javax.json.Json;
import javax.json.JsonArray;
import javax.json.JsonObject;
import javax.json.JsonReader;
import javax.json.JsonStructure;
import javax.json.JsonValue;

public class JsonParser {
	
	
	public List<Map<String,String>> getData(String json,String collection)
	{
		
		JsonReader reader = Json.createReader(new StringReader(json));
		
		JsonObject jsonObject = reader.readObject();
		
		reader.close();
		
		JsonArray jsonArray = (JsonArray) jsonObject.get(collection);
		
		List<Map<String,String>> dataCollection = new ArrayList();
		
		for(JsonValue jsonValue: jsonArray)
		{
			
			String jsonText = jsonValue.toString();
			
			Map<String,String> map = getData(jsonText);
			
			dataCollection.add(map);
		}
		
		return dataCollection;
	}

	public Map<String,String> getData(String json)
	{
        JsonReader reader = Json.createReader(new StringReader(json));
		
		JsonObject jsonObject = reader.readObject();
		
		reader.close();
		
		Set<String> keys = jsonObject.keySet();
		
		Map<String,String> map = new HashMap();
		
		for(String key: keys)
		{
			String value = jsonObject.get(key).toString();
			
			map.put(key, value);
		}
		
		return map;
	}
}
