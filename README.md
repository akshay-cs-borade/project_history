## **Project Conversation History**  
A **Ruby on Rails** application that allows teams to track **project progress, comments, and status changes**. Managers and developers can collaborate, while admins oversee everything.

---

## **🚀 Features**
- ✅ **Role-Based Access Control**  
  - Admin can manage all projects.  
  - Managers can create projects and assign them to developers.  
  - Developers can only view and comment on assigned projects.  
- ✅ **Project Status Management**  
  - Statuses: `Pending`, `In Progress`, `Completed`  
  - Only **Managers** and **Admins** can change project status.  
- ✅ **Commenting System**  
  - Users can leave comments but **cannot edit or delete them**.  
  - Only **Admins** can delete inappropriate comments.  
- ✅ **Email Notifications**  
  - Users receive **notifications** when a new comment or status change is made.  

---

## **🛠️ Technologies Used**
- **Backend**: Ruby on Rails  
- **Database**: PostgreSQL  
- **Frontend**: Bootstrap  
- **WebSockets**: ActionCable  
- **Authentication & Authorization**: Devise  
- **Notifications**: ActionMailer  

---

## **📜 Installation & Setup**
### **1. Clone the Repository**
```sh
git clone https://github.com/YOUR_USERNAME/project-conversation-history.git
cd project-conversation-history
```

### **2. Install Dependencies**
```sh
bundle install
```

### **3. Set Up Database**
```sh
rails db:create db:migrate db:seed
```

### **4. Start the Server**
```sh
rails s
```
Visit **[http://localhost:3000](http://localhost:3000)** in your browser.

---

## **🔑 User Roles & Permissions**
| Role     | Can Create Project | Can Assign Projects | Can Comment | Can Change Status | Can Delete Comments |
|----------|-------------------|---------------------|-------------|------------------|-------------------|
| **Admin**  | ✅ | ✅ (Assign to Anyone) | ✅ | ✅ | ✅ |
| **Manager** | ✅ | ✅ (Assign to Developers) | ✅ | ✅ | ❌ |
| **Developer** | ❌ | ❌ | ✅ | ❌ | ❌ |


---

## **📧 Email Notifications**
The app uses **ActionMailer** for notifications:
- Setup `config/environments/development.rb` with SMTP settings.
- Configure `config/environments/production.rb` for live emails.

