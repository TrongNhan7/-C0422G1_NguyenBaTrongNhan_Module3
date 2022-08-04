package service;

import model.Student;

import java.util.List;

public interface IStudentService {
    List<Student> findAll();
    List<Student> search(String name,String account, String classId);
    Student findById(int id);
    boolean add(Student student);
    String transaction();
    boolean delete(int id);
    boolean login(String username,String pass);
}
