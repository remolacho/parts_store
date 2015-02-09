module Audit
  extend ActiveSupport::Concern

  included do
    
     def add(audit)

       if audit then
         self.created_by = self.updated_by = audit.id
       else
         self.created_by = self.updated_by = 0
       end

       self.save

     end

     def change(params, audit)
       self.updated_by = audit.id if audit
       self.update(params)
     end

     def alter(audit)
       self.updated_by = audit.id if audit
       self.save
     end

  end

end