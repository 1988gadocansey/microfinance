/**
 * 
 */
package  com.gadeksystems.banking.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.Optional;
@Controller
public class DashboardController {
    private static final Logger LOGGER = LoggerFactory.getLogger( DashboardController.class);

    @RequestMapping("/dashboard")
    public String dashboard() {
        return "dashboard/dashboard";
    }

    @RequestMapping("/salut")
    public String salut() {
        return "home";
    }

}