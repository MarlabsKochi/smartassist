######user_statuses table
if ActiveRecord::Base.connection.table_exists? 'user_statuses'
  ActiveRecord::Base.connection.execute 'ALTER SEQUENCE user_statuses_id_seq RESTART WITH 1;'
  [{id: 1, name: "ArrivingAtEntrance"}, {id: 2, name: "ArrivedAtReception"}, 
   {id: 3, name: "AppointmentRequested"}, {id: 4, name: "AppointmentFixed"}, 
   {id: 5, name: "ConsultingDoctor"}, {id: 6, name: "Closed"}].each do |data|
    UserStatus.create(data)
  end
end  
######user_statuses table

######roles table
if ActiveRecord::Base.connection.table_exists? 'roles'
  ActiveRecord::Base.connection.execute 'ALTER SEQUENCE roles_id_seq RESTART WITH 1;'
  [{id: 1, name: "admin"}, {id: 2, name: "receptionist"}, 
   {id: 3, name: "nurse"}, {id: 4, name: "doctor"}, 
   {id: 5, name: "patient"}].each do |data|
    Role.create(data)
  end
end  
######roles table
