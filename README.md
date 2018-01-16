### admin/workshops_controller.rb
Despite being the same method, the edit and show methods in the controller work differently to keep the code RESTful. Show redirects to workshops/:id, whereas edit takes you to the update form, similar to create workshops/:is/edit
