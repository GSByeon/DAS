package spring.main;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

import spring.emp.DayDAO;
import spring.emp.DayDTO;
import spring.emp.EmpDAO;

public class DeleteDayRecordController implements Controller{

	
	/*
	 * process 
	 * 1. id���� DayDTO�� �Ҵ�.
	 * 2. DayDTO�� iBatis�� parameter������ �Ѵ�.
	 * 3. deleteDayRecord�� Day table�� �ִ� record �߿� 
	 * 	  day_id ���� id�� ���� record�� �����Ѵ�.
	 * 
	 */
	
	@Override
	public ModelAndView handleRequest(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		System.out.println("id : " + request.getParameter("id"));
		String dayId = request.getParameter("id");
		DayDTO dto = new DayDTO();
		DayDAO dao = new DayDAO();
		dto.setDay_id(Integer.parseInt(dayId));
		dao.deleteDayRecord(dto);
		
		return new ModelAndView("vacation.go");
		
	}
	
}
