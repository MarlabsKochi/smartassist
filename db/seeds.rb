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
