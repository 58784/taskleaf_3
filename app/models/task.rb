class Task < ApplicationRecord
    before_validation :set_nameless_name

    validates :name, presence: true
    validates :name, length: {maximum: 30}
    validate :validate_name_not_including_comma

    private

    def validate_name_not_including_comma
        errors.add(:name, 'カンマを含めることはできません') if name&.include?(',')
    end

    # ぼっち演算子(&.)nilを普通はエラーで返すが、エラーを返さずnilをnilで返す挙動

    def set_nameless_name
        self.name = '名前なし' if name.blank?
    end
end
