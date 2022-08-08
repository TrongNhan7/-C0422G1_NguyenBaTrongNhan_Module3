package service.impl;

import model.employee.Division;
import model.employee.Education;
import repository.impl.DivisionRepository;
import repository.impl.EducationRepository;

import java.util.List;

public class EducationService {
    EducationRepository educationRepository =new EducationRepository();
    public List<Education> getEducation() {
        return educationRepository.getEducation();
    }
}
