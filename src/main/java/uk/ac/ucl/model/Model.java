package uk.ac.ucl.model;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.core.type.TypeReference;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class Model {
  private static final String FILE_PATH = "data/noteExamples.json";

  public List<Map<String, String>> getAllNotes() {
    return readFile();
  }

  List<Map<String, String>> readFile() {
    List<Map<String, String>> data = new ArrayList<>();
    try {
      ObjectMapper objectMapper = new ObjectMapper();
      data = objectMapper.readValue(new File(FILE_PATH), new TypeReference<List<Map<String, String>>>() {});
    } catch (IOException e) {
      e.printStackTrace();
    }
    return data;
  }

  public void addNote(Map<String, String> newNote) {
    List<Map<String, String>> notes = getAllNotes();
    notes.add(newNote);
    writeFile(notes);
  }

  public void deleteNote(String name) {
    List<Map<String, String>> notes = getAllNotes();
    notes.removeIf(note -> note.get("name").equalsIgnoreCase(name));
    writeFile(notes);
  }

  public void updateNote(String oldName, String newName, String newLabel, String newDesc, String newImg, String newUrl) {
    List<Map<String, String>> notes = getAllNotes();

    for (Map<String, String> note : notes) {
      if (note.get("name").equals(oldName)) {
        note.put("name", newName);
        note.put("label", newLabel);
        note.put("desc", newDesc);
        note.put("img", newImg);
        note.put("url", newUrl);
        break;
      }
    }

    writeFile(notes);
  }

  private void writeFile(List<Map<String, String>> notes) {
    try {
      ObjectMapper objectMapper = new ObjectMapper();
      objectMapper.writeValue(new File(FILE_PATH), notes);
    } catch (IOException e) {
      e.printStackTrace();
    }
  }

  public Map<String, String> getNoteByName(String name) {
    List<Map<String, String>> notes = getAllNotes();

    for (Map<String, String> note : notes) {
      if (note.get("name").equals(name)) {
        return note;
      }
    }
    return null; // Returns null if note w name not found
  }

}



