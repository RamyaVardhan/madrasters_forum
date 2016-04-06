class AddEventDisplayIdTrigger < ActiveRecord::Migration
  def change
  	execute <<-SQL
  		  CREATE TRIGGER add_event_display_id BEFORE INSERT ON events 
        FOR EACH ROW
      	BEGIN
       		DECLARE event_dis_id integer;
       		DECLARE max_dis_id integer;
       		IF (new.display_id IS NULL) THEN
        		SELECT max(display_id) INTO max_dis_id FROM events WHERE event_type = new.event_type AND location_id = new.location_id;
		        SET event_dis_id = 0;
		        IF (max_dis_id IS NULL) THEN
		            SET max_dis_id = 1;
		        ELSE
		            SET max_dis_id = max_dis_id + 1;
		        END IF;
		        if event_dis_id > max_dis_id then
		         	SET new.display_id = event_dis_id;
		        ELSE
		         	SET new.display_id = max_dis_id;
		        END IF;
       		END IF;
        END;
  	SQL
  end
end
