module CurrentScope
  mattr_accessor :user
end

ActiveSupport.on_load(:action_text_rich_text) do
  ActionText::RichText.class_eval do
    before_save :record_change

    private

    def record_change
      return unless self.body_changed?
      return if name == 'content' && record_type == 'Version'

      Version.create(item: record, content: self.body_was, user: CurrentScope.user)
    end
  end
end