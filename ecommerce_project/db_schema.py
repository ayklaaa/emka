# This is an auto-generated Django model module.
# You'll have to do the following manually to clean this up:
#   * Rearrange models' order
#   * Make sure each model has one field with primary_key=True
#   * Make sure each ForeignKey and OneToOneField has `on_delete` set to the desired behavior
#   * Remove `managed = False` lines if you wish to allow Django to create, modify, and delete the table
# Feel free to rename the models, but don't rename db_table values or field names.
from django.db import models


class AuthGroup(models.Model):
    name = models.CharField(unique=True, max_length=150)

    class Meta:
        managed = False
        db_table = 'auth_group'


class AuthGroupPermissions(models.Model):
    group = models.ForeignKey(AuthGroup, models.DO_NOTHING)
    permission = models.ForeignKey('AuthPermission', models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'auth_group_permissions'
        unique_together = (('group', 'permission'),)


class AuthPermission(models.Model):
    content_type = models.ForeignKey('DjangoContentType', models.DO_NOTHING)
    codename = models.CharField(max_length=100)
    name = models.CharField(max_length=255)

    class Meta:
        managed = False
        db_table = 'auth_permission'
        unique_together = (('content_type', 'codename'),)


class BlogArticle(models.Model):
    title = models.CharField(max_length=200)
    image = models.CharField(max_length=100)
    image_caption = models.CharField(max_length=200)
    content = models.TextField()
    published_date = models.DateTimeField()
    is_published = models.BooleanField()
    author = models.ForeignKey('UsersUser', models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'blog_article'


class DjangoAdminLog(models.Model):
    object_id = models.TextField(blank=True, null=True)
    object_repr = models.CharField(max_length=200)
    action_flag = models.PositiveSmallIntegerField()
    change_message = models.TextField()
    content_type = models.ForeignKey('DjangoContentType', models.DO_NOTHING, blank=True, null=True)
    user = models.ForeignKey('UsersUser', models.DO_NOTHING)
    action_time = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'django_admin_log'


class DjangoContentType(models.Model):
    app_label = models.CharField(max_length=100)
    model = models.CharField(max_length=100)

    class Meta:
        managed = False
        db_table = 'django_content_type'
        unique_together = (('app_label', 'model'),)


class DjangoMigrations(models.Model):
    app = models.CharField(max_length=255)
    name = models.CharField(max_length=255)
    applied = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'django_migrations'


class DjangoSession(models.Model):
    session_key = models.CharField(primary_key=True, max_length=40)
    session_data = models.TextField()
    expire_date = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'django_session'


class OrdersCart(models.Model):
    created_at = models.DateTimeField()
    user = models.OneToOneField('UsersUser', models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'orders_cart'


class OrdersCartitem(models.Model):
    quantity = models.PositiveIntegerField()
    size = models.CharField(max_length=10)
    cart = models.ForeignKey(OrdersCart, models.DO_NOTHING)
    product = models.ForeignKey('ProductsProduct', models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'orders_cartitem'


class OrdersOrder(models.Model):
    first_name = models.CharField(max_length=50)
    last_name = models.CharField(max_length=50)
    email = models.CharField(max_length=254)
    phone = models.CharField(max_length=20)
    address = models.TextField()
    total_price = models.DecimalField(max_digits=10, decimal_places=5)  # max_digits and decimal_places have been guessed, as this database handles decimal fields as float
    payment_method = models.CharField(max_length=10)
    delivery_method = models.CharField(max_length=10)
    status = models.CharField(max_length=20)
    created_at = models.DateTimeField()
    updated_at = models.DateTimeField()
    user = models.ForeignKey('UsersUser', models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'orders_order'


class OrdersOrderitem(models.Model):
    quantity = models.PositiveIntegerField()
    price = models.DecimalField(max_digits=10, decimal_places=5)  # max_digits and decimal_places have been guessed, as this database handles decimal fields as float
    size = models.CharField(max_length=10)
    order = models.ForeignKey(OrdersOrder, models.DO_NOTHING)
    product = models.ForeignKey('ProductsProduct', models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'orders_orderitem'


class ProductsCategory(models.Model):
    name = models.CharField(max_length=100)
    slug = models.CharField(unique=True, max_length=50)

    class Meta:
        managed = False
        db_table = 'products_category'


class ProductsCompare(models.Model):
    session_key = models.CharField(max_length=40, blank=True, null=True)
    user = models.ForeignKey('UsersUser', models.DO_NOTHING, blank=True, null=True)
    product = models.ForeignKey('ProductsProduct', models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'products_compare'
        unique_together = (('user', 'product'), ('session_key', 'product'),)


class ProductsProduct(models.Model):
    name = models.CharField(max_length=255)
    slug = models.CharField(unique=True, max_length=50, blank=True, null=True)
    description = models.TextField()
    price = models.DecimalField(max_digits=10, decimal_places=5)  # max_digits and decimal_places have been guessed, as this database handles decimal fields as float
    stock = models.PositiveIntegerField()
    image = models.CharField(max_length=100, blank=True, null=True)
    created_at = models.DateTimeField()
    is_recommended = models.BooleanField()
    is_new = models.BooleanField()
    is_seasonal = models.BooleanField()
    is_popular = models.BooleanField()
    discounted_price = models.DecimalField(max_digits=10, decimal_places=5, blank=True, null=True)  # max_digits and decimal_places have been guessed, as this database handles decimal fields as float
    is_discounted = models.BooleanField()
    rating = models.DecimalField(max_digits=10, decimal_places=5, blank=True, null=True)  # max_digits and decimal_places have been guessed, as this database handles decimal fields as float
    brand = models.CharField(max_length=255, blank=True, null=True)
    seasonal_tag = models.CharField(max_length=50, blank=True, null=True)
    category = models.ForeignKey(ProductsCategory, models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'products_product'


class ProductsProductTags(models.Model):
    product = models.ForeignKey(ProductsProduct, models.DO_NOTHING)
    tag = models.ForeignKey('ProductsTag', models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'products_product_tags'
        unique_together = (('product', 'tag'),)


class ProductsProductimage(models.Model):
    image = models.CharField(max_length=100)
    product = models.ForeignKey(ProductsProduct, models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'products_productimage'


class ProductsReview(models.Model):
    rating = models.PositiveIntegerField()
    comment = models.TextField()
    created_at = models.DateTimeField()
    product = models.ForeignKey(ProductsProduct, models.DO_NOTHING)
    user = models.ForeignKey('UsersUser', models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'products_review'


class ProductsSizeoption(models.Model):
    size = models.CharField(max_length=10)
    product = models.ForeignKey(ProductsProduct, models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'products_sizeoption'


class ProductsTag(models.Model):
    name = models.CharField(unique=True, max_length=50)
    slug = models.CharField(unique=True, max_length=50)

    class Meta:
        managed = False
        db_table = 'products_tag'


class ProductsWishlist(models.Model):
    added_at = models.DateTimeField()
    product = models.ForeignKey(ProductsProduct, models.DO_NOTHING)
    user = models.ForeignKey('UsersUser', models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'products_wishlist'
        unique_together = (('user', 'product'),)


class SocialAuthAssociation(models.Model):
    server_url = models.CharField(max_length=255)
    handle = models.CharField(max_length=255)
    secret = models.CharField(max_length=255)
    issued = models.IntegerField()
    lifetime = models.IntegerField()
    assoc_type = models.CharField(max_length=64)

    class Meta:
        managed = False
        db_table = 'social_auth_association'
        unique_together = (('server_url', 'handle'),)


class SocialAuthCode(models.Model):
    email = models.CharField(max_length=254)
    code = models.CharField(max_length=32)
    verified = models.BooleanField()
    timestamp = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'social_auth_code'
        unique_together = (('email', 'code'),)


class SocialAuthNonce(models.Model):
    server_url = models.CharField(max_length=255)
    timestamp = models.IntegerField()
    salt = models.CharField(max_length=65)

    class Meta:
        managed = False
        db_table = 'social_auth_nonce'
        unique_together = (('server_url', 'timestamp', 'salt'),)


class SocialAuthPartial(models.Model):
    token = models.CharField(max_length=32)
    next_step = models.PositiveSmallIntegerField()
    backend = models.CharField(max_length=32)
    timestamp = models.DateTimeField()
    data = models.JSONField()

    class Meta:
        managed = False
        db_table = 'social_auth_partial'


class SocialAuthUsersocialauth(models.Model):
    provider = models.CharField(max_length=32)
    uid = models.CharField(max_length=255)
    user = models.ForeignKey('UsersUser', models.DO_NOTHING)
    created = models.DateTimeField()
    modified = models.DateTimeField()
    extra_data = models.JSONField()

    class Meta:
        managed = False
        db_table = 'social_auth_usersocialauth'
        unique_together = (('provider', 'uid'),)


class UsersCustomeruser(models.Model):
    password = models.CharField(max_length=128)
    last_login = models.DateTimeField(blank=True, null=True)
    is_superuser = models.BooleanField()
    username = models.CharField(unique=True, max_length=150)
    first_name = models.CharField(max_length=150)
    last_name = models.CharField(max_length=150)
    email = models.CharField(max_length=254)
    is_staff = models.BooleanField()
    date_joined = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'users_customeruser'


class UsersCustomeruserGroups(models.Model):
    customeruser = models.ForeignKey(UsersCustomeruser, models.DO_NOTHING)
    group = models.ForeignKey(AuthGroup, models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'users_customeruser_groups'
        unique_together = (('customeruser', 'group'),)


class UsersCustomeruserUserPermissions(models.Model):
    customeruser = models.ForeignKey(UsersCustomeruser, models.DO_NOTHING)
    permission = models.ForeignKey(AuthPermission, models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'users_customeruser_user_permissions'
        unique_together = (('customeruser', 'permission'),)


class UsersReward(models.Model):
    name = models.CharField(unique=True, max_length=255)
    description = models.TextField()
    threshold = models.IntegerField()
    type = models.CharField(max_length=50)

    class Meta:
        managed = False
        db_table = 'users_reward'


class UsersUser(models.Model):
    password = models.CharField(max_length=128)
    last_login = models.DateTimeField(blank=True, null=True)
    is_superuser = models.BooleanField()
    username = models.CharField(unique=True, max_length=150)
    first_name = models.CharField(max_length=150)
    last_name = models.CharField(max_length=150)
    email = models.CharField(max_length=254)
    is_staff = models.BooleanField()
    is_active = models.BooleanField()
    date_joined = models.DateTimeField()
    role = models.CharField(max_length=20)
    phone_number = models.CharField(max_length=15, blank=True, null=True)
    address = models.TextField(blank=True, null=True)
    birth_date = models.DateField(blank=True, null=True)
    avatar = models.CharField(max_length=100, blank=True, null=True)
    is_admin = models.BooleanField()
    secret_code = models.CharField(max_length=100, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'users_user'


class UsersUserGroups(models.Model):
    user = models.ForeignKey(UsersUser, models.DO_NOTHING)
    group = models.ForeignKey(AuthGroup, models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'users_user_groups'
        unique_together = (('user', 'group'),)


class UsersUserUserPermissions(models.Model):
    user = models.ForeignKey(UsersUser, models.DO_NOTHING)
    permission = models.ForeignKey(AuthPermission, models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'users_user_user_permissions'
        unique_together = (('user', 'permission'),)


class UsersUserreward(models.Model):
    date_earned = models.DateTimeField()
    reward = models.ForeignKey(UsersReward, models.DO_NOTHING)
    user = models.ForeignKey(UsersUser, models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'users_userreward'
        unique_together = (('user', 'reward'),)
