package service.impl;

import model.Student;
import repository.IStudentRepository;
import repository.impl.StudentRepository;
import service.IStudentService;

import java.util.List;

public class StudentService implements IStudentService {
   private IStudentRepository studentRepository = new StudentRepository();
    @Override
    public List<Student> findAll() {
        return studentRepository.findAll();
    }

    @Override
    public List<Student> search(String name, String account, String classId) {
        return studentRepository.search(name,account,classId);
    }

    @Override
    public Student findById(int id) {
        return null;
    }

    @Override
    public boolean add(Student student) {

        // validate dữ liệu chô này
        // nêu ok thì thêm mới
       return studentRepository.add(student);

    }

    @Override
    public String transaction() {
        return studentRepository.transaction();
    }

    @Override
    public boolean delete(int id) {
        return studentRepository.delete(id);
    }

    @Override
    public boolean login(String username, String pass) {

        return studentRepository.login(username,pass);
    }
}
