package myassignment.controller;




import java.util.List;
import org.json.JSONObject;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.HttpStatusCodeException;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.util.UriComponentsBuilder;
import myassignment.dto.CustomerDto;
import myassignment.dto.logindto;
import myassignment.model.Customer;
import myassignment.model.User;



@Controller
public class MyController {
	
	ResponseEntity<String> token;
	
	@RequestMapping("/")
	   public String viewIndex() {
		   return "index";
	   }
	@RequestMapping("/loginpage")
	public String loginPage(Model model) {
		model.addAttribute("login", new User());
		return "loginpage";
	}
	
	@RequestMapping(value= "/CustomerPage")
	 public String createPage(Model model) {
			model.addAttribute("create", new Customer());
			return "CreateCustomerPage";
		}
	
	 @RequestMapping(value= "/UpdatePage")
	 public String updatepage(@RequestParam("uuid")String uuid,Model model) {
			model.addAttribute("update", new Customer());
			model.addAttribute("uuid",uuid);
			return "UpdateCustomer";
		}
	 
	 @RequestMapping("/DashBoard")
	 public String dashboard(@ModelAttribute("response") List res, Model m) {
		 m.addAttribute("responsedata",res);
		 return "DashBoard";
	 }
	
	 @RequestMapping(value = "/login", method = RequestMethod.POST)
	   public String login(@ModelAttribute("logindto") logindto logindto) {
		 String url="https://qa2.sunbasedata.com/sunbase/portal/api/assignment_auth.jsp";
		 RestTemplate resttemplete = new RestTemplate();
		 HttpHeaders header = new HttpHeaders();
		 header.setContentType(MediaType.APPLICATION_JSON);
		 HttpEntity<logindto> requestEntity = new HttpEntity<logindto>(logindto, header);
		 try {
			 token= resttemplete.postForEntity(url, requestEntity,String.class);
		 }catch(HttpStatusCodeException e){
			 token= resttemplete.postForEntity(url, requestEntity,String.class);
		 }
		 
		 return "redirect:/showdata";
	   }
	   
	  
	   @RequestMapping(value = "/createcustomer", method = RequestMethod.POST)
	   public String createuser(@ModelAttribute("customerdto") CustomerDto customerdto) {
		 RestTemplate resttemplete = new RestTemplate();
		 String url="https://qa2.sunbasedata.com/sunbase/portal/api/assignment.jsp";
		 HttpHeaders header = new HttpHeaders();
		 header.setContentType(MediaType.APPLICATION_JSON);
		 JSONObject jsonObject = new JSONObject(token.getBody().toString());
		 header.setBearerAuth(jsonObject.getString("access_token"));
		 UriComponentsBuilder builder = UriComponentsBuilder.fromHttpUrl(url);
		 builder.queryParam("cmd", "create").build();
		
		 HttpEntity<CustomerDto> requestEntity = new HttpEntity<CustomerDto>(customerdto, header);
		 try {
			 resttemplete.postForObject(builder.toUriString(), requestEntity, String.class);
		 }catch(HttpStatusCodeException e) {
		        System.out.println(ResponseEntity.status(e.getRawStatusCode()).headers(e.getResponseHeaders())
		                .body(e.getResponseBodyAsString()));
		    }
		 return "redirect:/showdata";
	   }
	   
	   @RequestMapping(value = "/updatecustomer/{uuid}")
	   public String updatecustomer(@ModelAttribute("customerdto") CustomerDto customerdto,@PathVariable("uuid")String uuid) {
		 RestTemplate resttemplete = new RestTemplate();
		 String url="https://qa2.sunbasedata.com/sunbase/portal/api/assignment.jsp";
		 HttpHeaders header = new HttpHeaders();
		 header.setContentType(MediaType.APPLICATION_JSON);
		 JSONObject jsonObject = new JSONObject(token.getBody().toString());
		 header.setBearerAuth(jsonObject.getString("access_token"));
		 UriComponentsBuilder builder = UriComponentsBuilder.fromHttpUrl(url);
		 builder.queryParam("cmd", "update").
		 queryParam("uuid",uuid).build();
		
		 HttpEntity<CustomerDto> requestEntity = new HttpEntity<CustomerDto>(customerdto, header);
		 try {
			 resttemplete.exchange(builder.toUriString(), HttpMethod.POST, requestEntity, String.class);
		 }catch(HttpStatusCodeException e) {
		        System.out.println(ResponseEntity.status(e.getRawStatusCode()).headers(e.getResponseHeaders())
		                .body(e.getResponseBodyAsString()));
		    }
		 return "redirect:/showdata";
	   }
	   
	   @RequestMapping("/deletecustomer/{uuid}")
	   public String updatecustomer(@PathVariable("uuid")String uuid) {
		 RestTemplate resttemplete = new RestTemplate();
		 String url="https://qa2.sunbasedata.com/sunbase/portal/api/assignment.jsp";
		 HttpHeaders header = new HttpHeaders();
		 header.setContentType(MediaType.APPLICATION_JSON);
		 JSONObject jsonObject = new JSONObject(token.getBody().toString());
		 header.setBearerAuth(jsonObject.getString("access_token"));
		 UriComponentsBuilder builder = UriComponentsBuilder.fromHttpUrl(url);
		 builder.queryParam("cmd", "delete").
		 queryParam("uuid",uuid).build();
		 
		 HttpEntity<CustomerDto> requestEntity = new HttpEntity<CustomerDto>(header);
		 try {
			 resttemplete.exchange(builder.toUriString(), HttpMethod.POST, requestEntity, String.class);
		 }catch(HttpStatusCodeException e) {
		        System.out.println(ResponseEntity.status(e.getRawStatusCode()).headers(e.getResponseHeaders())
		                .body(e.getResponseBodyAsString()));
		    }
		 return "redirect:/showdata";
	   }
	   
	   @RequestMapping(value="/showdata")
	   public String showdata(RedirectAttributes ra) {
		 RestTemplate resttemplete = new RestTemplate();
		 String url="https://qa2.sunbasedata.com/sunbase/portal/api/assignment.jsp";
		 HttpHeaders header = new HttpHeaders();
		 header.setContentType(MediaType.APPLICATION_JSON);
		 JSONObject jsonObject = new JSONObject(token.getBody().toString());
		 String accessToken= jsonObject.get("access_token").toString();
		 header.set("Authorization", "Bearer " + accessToken);
		 UriComponentsBuilder builder = UriComponentsBuilder.fromHttpUrl(url);
		 builder.queryParam("cmd", "get_customer_list").build();
		 HttpEntity<Void> requestEntity = new HttpEntity<>(header);
		 try {
         ResponseEntity<List> response = resttemplete.exchange(
		 builder.toUriString(), HttpMethod.GET, requestEntity, List.class );
         ra.addFlashAttribute("response",response.getBody());
		 }catch(HttpStatusCodeException e) {
		        System.out.println(ResponseEntity.status(e.getRawStatusCode()).headers(e.getResponseHeaders())
		                .body(e.getResponseBodyAsString()));
		    }
		 return "redirect:/DashBoard";
	   }
}
