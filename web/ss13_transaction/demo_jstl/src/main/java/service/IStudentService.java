package service;

import model.Student;

import java.util.List;

public interface IStudentService {
    List<Student> findAll();
    Student findById(int id);
    boolean add(Student student);
    String transaction();
    boolean delete(int id);
}
