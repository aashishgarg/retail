class Product < ApplicationRecord
  # --- Associations ---- #
  belongs_to :product_class, inverse_of: :products, dependent: :destroy
  has_many :product_attributes, through: :product_class
  has_many :variants, inverse_of: :product, dependent: :destroy

  # --- Callbacks --- #
  after_commit :create_product_variants

  notify sender: :product_class,
         receivers: :variants,
         actions: [:follow, :unfollow, :update, :create],
         notify_message: :message_method,
         before_notify: :before_notify_method,
         after_notify: :after_notify_method,
         before_delivered: :before_delivered_method,
         after_delivered: :after_delivered_method,
         before_read: :before_read_method,
         after_read: :after_read_method

  # Step to follow
  # rails generate simple_notifications:install
  # rails db:drop db:create db:migrate db:seed
  # ProductClass.first.products.create(name: 'asadas')
  # ProductClass.first.products.create(name: 'asadas', message: 'object level custom message')
  # Product.last.update(name: 'asadas')
  # Product.last.follow
  # Product.last.notifications.last.deliveries.last.update(is_delivered: true)
  # Product.last.notifications.last.deliveries.last.update(is_read: true)
  # Product.last.notify(sender: ProductClass.first, receivers: Variants.all)
  # ProductClass.first.products.create(name: 'asadas', notify: false)

  # --- Callbacks --- #
  after_create_commit :create_product_variants

  def follow

  end

  def unfollow

  end

  def message_method
    'My dd_message'
  end

  def before_notify_method
    puts '******BEFOREBEFOREBEFOREBEFORE-Notify**********************************'
  end

  def after_notify_method
    puts '******AFTERAFTERAFTERAFTER-Notify**********************************'
  end

  def before_read_method
    puts '******BEFOREBEFOREBEFOREBEFORE-Read**********************************'
  end

  def after_read_method
    puts '******AFTERAFTERAFTERAFTER-Read**********************************'
  end

  def before_delivered_method
    puts '******BEFOREBEFOREBEFOREBEFORE-Delivered**********************************'
  end

  def after_delivered_method
    puts '******AFTERAFTERAFTERAFTER-Delivered**********************************'
  end

  # --- Instance methods --- #
  def type
    product_class.name
  end

  private

  def create_product_variants
    if product_class.product_attributes.present?
      collection = product_attributes.collect {|x| x.attribute_choices}
      collection.collect!(&:to_a)
      pairs = collection[0].product(*collection[1..-1])
      pairs.each do |pair|
        variant_name = ''
        variant_name << name
        pair.each {|attr| variant_name << " #{attr.product_attribute.name}:#{attr.name}"}
        variants.create(name: variant_name, sku: 'sku1', attribute_choices: pair)
      end
    else
      variants.create(name: name, sku: 'sku2')
    end
  end
end
