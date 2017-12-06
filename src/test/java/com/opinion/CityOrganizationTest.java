package com.opinion;

import com.opinion.base.BaseTest;
import com.opinion.mysql.entity.CityOrganization;
import com.opinion.mysql.service.CityOrganizationService;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * @author zhangtong
 * Created by on 2017/12/6
 */
public class CityOrganizationTest extends BaseTest {

    @Autowired
    private CityOrganizationService cityOrganizationService;

    @Test
    public void test1() {
        CityOrganization cityOrganization = cityOrganizationService.findParentAndChildrenById(1L);
        System.out.println("cityOrganization = " + cityOrganization);
//        List<CityOrganization> cityOrganizations = cityOrganizationService.findParentAndChildren(cityOrganization);
    }
}
