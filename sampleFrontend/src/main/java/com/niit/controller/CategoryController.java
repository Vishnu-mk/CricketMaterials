package com.niit.controller;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import com.niit.dao.CategoryDao;
import com.niit.model.Category;
@Controller
public class CategoryController {
 @Autowired
 CategoryDao categoryDao;
 boolean flag = true;
 @RequestMapping("/category")
 public String showCategory(Model m) {
  List<Category> listCategories = categoryDao.getCategories();
  m.addAttribute("listCategories", listCategories);
  for (Category category : listCategories) {
   System.out.println(category.getCategoryname() + ",");
  }
  flag = false;
  return "category";
 }
 @RequestMapping(value = "/admin/InsertCategory", method = RequestMethod.POST)
 public String insertCategoryData(@RequestParam("catname") String catname, @RequestParam("catdesc") String catdesc,
   Model m) {
  Category category = new Category();
  category.setCategoryname(catname);
  category.setCategorydesc(catdesc);
  categoryDao.addCategory(category);
  List<Category> listCategories = categoryDao.getCategories();
  m.addAttribute("listCategories", listCategories);
  flag = false;
  return "category";
 }
 @RequestMapping("/admin/deleteCategory/{id}")
 public String deleteCategory(@PathVariable("id") int categoryId,Model m)
 {
  Category category=categoryDao.getCategory(categoryId);
  
  categoryDao.deleteCategory(category);
  
  List<Category> listCategories=categoryDao.getCategories();
  m.addAttribute("listCategories",listCategories);
  flag=false;
  return "category";
 }
 @RequestMapping("/admin/updateCategory/{id}")
 public String updateCategory(@PathVariable("id") int categoryId,Model m)
 {
  Category category=categoryDao.getCategory(categoryId);
  
  
  List<Category> listCategories=categoryDao.getCategories();
  m.addAttribute("listCategories",listCategories);
  m.addAttribute("categoryInfo",category);
  
  return "updatecategory";
 }
 @RequestMapping(value="/admin/UpdateCategory",method=RequestMethod.POST)
 public String updateCategoryInDB(@RequestParam("catid") int categoryId,@RequestParam("catname") String categoryName,
   @RequestParam("catdesc") String categoryDesc,Model m)
 {
  Category category=categoryDao.getCategory(categoryId);
  category.setCategoryname(categoryName);
  category.setCategorydesc(categoryDesc);
  
  categoryDao.updateCategory(category);
  
  List<Category> listCategories=categoryDao.getCategories();
  m.addAttribute("listCategories",listCategories);
  
  return "category";
 }
}
