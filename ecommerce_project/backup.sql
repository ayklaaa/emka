BEGIN TRANSACTION;
CREATE TABLE "auth_group" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "name" varchar(150) NOT NULL UNIQUE);
CREATE TABLE "auth_group_permissions" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "group_id" integer NOT NULL REFERENCES "auth_group" ("id") DEFERRABLE INITIALLY DEFERRED, "permission_id" integer NOT NULL REFERENCES "auth_permission" ("id") DEFERRABLE INITIALLY DEFERRED);
CREATE TABLE "auth_permission" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "content_type_id" integer NOT NULL REFERENCES "django_content_type" ("id") DEFERRABLE INITIALLY DEFERRED, "codename" varchar(100) NOT NULL, "name" varchar(255) NOT NULL);
INSERT INTO "auth_permission" VALUES(1,1,'add_logentry','Can add log entry');
INSERT INTO "auth_permission" VALUES(2,1,'change_logentry','Can change log entry');
INSERT INTO "auth_permission" VALUES(3,1,'delete_logentry','Can delete log entry');
INSERT INTO "auth_permission" VALUES(4,1,'view_logentry','Can view log entry');
INSERT INTO "auth_permission" VALUES(5,2,'add_permission','Can add permission');
INSERT INTO "auth_permission" VALUES(6,2,'change_permission','Can change permission');
INSERT INTO "auth_permission" VALUES(7,2,'delete_permission','Can delete permission');
INSERT INTO "auth_permission" VALUES(8,2,'view_permission','Can view permission');
INSERT INTO "auth_permission" VALUES(9,3,'add_group','Can add group');
INSERT INTO "auth_permission" VALUES(10,3,'change_group','Can change group');
INSERT INTO "auth_permission" VALUES(11,3,'delete_group','Can delete group');
INSERT INTO "auth_permission" VALUES(12,3,'view_group','Can view group');
INSERT INTO "auth_permission" VALUES(13,4,'add_contenttype','Can add content type');
INSERT INTO "auth_permission" VALUES(14,4,'change_contenttype','Can change content type');
INSERT INTO "auth_permission" VALUES(15,4,'delete_contenttype','Can delete content type');
INSERT INTO "auth_permission" VALUES(16,4,'view_contenttype','Can view content type');
INSERT INTO "auth_permission" VALUES(17,5,'add_session','Can add session');
INSERT INTO "auth_permission" VALUES(18,5,'change_session','Can change session');
INSERT INTO "auth_permission" VALUES(19,5,'delete_session','Can delete session');
INSERT INTO "auth_permission" VALUES(20,5,'view_session','Can view session');
INSERT INTO "auth_permission" VALUES(21,6,'add_association','Can add association');
INSERT INTO "auth_permission" VALUES(22,6,'change_association','Can change association');
INSERT INTO "auth_permission" VALUES(23,6,'delete_association','Can delete association');
INSERT INTO "auth_permission" VALUES(24,6,'view_association','Can view association');
INSERT INTO "auth_permission" VALUES(25,7,'add_code','Can add code');
INSERT INTO "auth_permission" VALUES(26,7,'change_code','Can change code');
INSERT INTO "auth_permission" VALUES(27,7,'delete_code','Can delete code');
INSERT INTO "auth_permission" VALUES(28,7,'view_code','Can view code');
INSERT INTO "auth_permission" VALUES(29,8,'add_nonce','Can add nonce');
INSERT INTO "auth_permission" VALUES(30,8,'change_nonce','Can change nonce');
INSERT INTO "auth_permission" VALUES(31,8,'delete_nonce','Can delete nonce');
INSERT INTO "auth_permission" VALUES(32,8,'view_nonce','Can view nonce');
INSERT INTO "auth_permission" VALUES(33,9,'add_usersocialauth','Can add user social auth');
INSERT INTO "auth_permission" VALUES(34,9,'change_usersocialauth','Can change user social auth');
INSERT INTO "auth_permission" VALUES(35,9,'delete_usersocialauth','Can delete user social auth');
INSERT INTO "auth_permission" VALUES(36,9,'view_usersocialauth','Can view user social auth');
INSERT INTO "auth_permission" VALUES(37,10,'add_partial','Can add partial');
INSERT INTO "auth_permission" VALUES(38,10,'change_partial','Can change partial');
INSERT INTO "auth_permission" VALUES(39,10,'delete_partial','Can delete partial');
INSERT INTO "auth_permission" VALUES(40,10,'view_partial','Can view partial');
INSERT INTO "auth_permission" VALUES(41,11,'add_reward','Can add Достижение');
INSERT INTO "auth_permission" VALUES(42,11,'change_reward','Can change Достижение');
INSERT INTO "auth_permission" VALUES(43,11,'delete_reward','Can delete Достижение');
INSERT INTO "auth_permission" VALUES(44,11,'view_reward','Can view Достижение');
INSERT INTO "auth_permission" VALUES(45,12,'add_user','Can add Пользователь');
INSERT INTO "auth_permission" VALUES(46,12,'change_user','Can change Пользователь');
INSERT INTO "auth_permission" VALUES(47,12,'delete_user','Can delete Пользователь');
INSERT INTO "auth_permission" VALUES(48,12,'view_user','Can view Пользователь');
INSERT INTO "auth_permission" VALUES(49,13,'add_userreward','Can add Полученное достижение');
INSERT INTO "auth_permission" VALUES(50,13,'change_userreward','Can change Полученное достижение');
INSERT INTO "auth_permission" VALUES(51,13,'delete_userreward','Can delete Полученное достижение');
INSERT INTO "auth_permission" VALUES(52,13,'view_userreward','Can view Полученное достижение');
INSERT INTO "auth_permission" VALUES(53,14,'add_cart','Can add cart');
INSERT INTO "auth_permission" VALUES(54,14,'change_cart','Can change cart');
INSERT INTO "auth_permission" VALUES(55,14,'delete_cart','Can delete cart');
INSERT INTO "auth_permission" VALUES(56,14,'view_cart','Can view cart');
INSERT INTO "auth_permission" VALUES(57,15,'add_cartitem','Can add cart item');
INSERT INTO "auth_permission" VALUES(58,15,'change_cartitem','Can change cart item');
INSERT INTO "auth_permission" VALUES(59,15,'delete_cartitem','Can delete cart item');
INSERT INTO "auth_permission" VALUES(60,15,'view_cartitem','Can view cart item');
INSERT INTO "auth_permission" VALUES(61,16,'add_order','Can add order');
INSERT INTO "auth_permission" VALUES(62,16,'change_order','Can change order');
INSERT INTO "auth_permission" VALUES(63,16,'delete_order','Can delete order');
INSERT INTO "auth_permission" VALUES(64,16,'view_order','Can view order');
INSERT INTO "auth_permission" VALUES(65,17,'add_orderitem','Can add order item');
INSERT INTO "auth_permission" VALUES(66,17,'change_orderitem','Can change order item');
INSERT INTO "auth_permission" VALUES(67,17,'delete_orderitem','Can delete order item');
INSERT INTO "auth_permission" VALUES(68,17,'view_orderitem','Can view order item');
INSERT INTO "auth_permission" VALUES(69,18,'add_category','Can add Категория');
INSERT INTO "auth_permission" VALUES(70,18,'change_category','Can change Категория');
INSERT INTO "auth_permission" VALUES(71,18,'delete_category','Can delete Категория');
INSERT INTO "auth_permission" VALUES(72,18,'view_category','Can view Категория');
INSERT INTO "auth_permission" VALUES(73,19,'add_compare','Can add Сравнение');
INSERT INTO "auth_permission" VALUES(74,19,'change_compare','Can change Сравнение');
INSERT INTO "auth_permission" VALUES(75,19,'delete_compare','Can delete Сравнение');
INSERT INTO "auth_permission" VALUES(76,19,'view_compare','Can view Сравнение');
INSERT INTO "auth_permission" VALUES(77,20,'add_product','Can add Товар');
INSERT INTO "auth_permission" VALUES(78,20,'change_product','Can change Товар');
INSERT INTO "auth_permission" VALUES(79,20,'delete_product','Can delete Товар');
INSERT INTO "auth_permission" VALUES(80,20,'view_product','Can view Товар');
INSERT INTO "auth_permission" VALUES(81,21,'add_productimage','Can add product image');
INSERT INTO "auth_permission" VALUES(82,21,'change_productimage','Can change product image');
INSERT INTO "auth_permission" VALUES(83,21,'delete_productimage','Can delete product image');
INSERT INTO "auth_permission" VALUES(84,21,'view_productimage','Can view product image');
INSERT INTO "auth_permission" VALUES(85,22,'add_review','Can add review');
INSERT INTO "auth_permission" VALUES(86,22,'change_review','Can change review');
INSERT INTO "auth_permission" VALUES(87,22,'delete_review','Can delete review');
INSERT INTO "auth_permission" VALUES(88,22,'view_review','Can view review');
INSERT INTO "auth_permission" VALUES(89,23,'add_sizeoption','Can add Доступный размер');
INSERT INTO "auth_permission" VALUES(90,23,'change_sizeoption','Can change Доступный размер');
INSERT INTO "auth_permission" VALUES(91,23,'delete_sizeoption','Can delete Доступный размер');
INSERT INTO "auth_permission" VALUES(92,23,'view_sizeoption','Can view Доступный размер');
INSERT INTO "auth_permission" VALUES(93,24,'add_tag','Can add tag');
INSERT INTO "auth_permission" VALUES(94,24,'change_tag','Can change tag');
INSERT INTO "auth_permission" VALUES(95,24,'delete_tag','Can delete tag');
INSERT INTO "auth_permission" VALUES(96,24,'view_tag','Can view tag');
INSERT INTO "auth_permission" VALUES(97,25,'add_wishlist','Can add wishlist');
INSERT INTO "auth_permission" VALUES(98,25,'change_wishlist','Can change wishlist');
INSERT INTO "auth_permission" VALUES(99,25,'delete_wishlist','Can delete wishlist');
INSERT INTO "auth_permission" VALUES(100,25,'view_wishlist','Can view wishlist');
INSERT INTO "auth_permission" VALUES(101,26,'add_orderstatuslog','Can add Лог статуса заказа');
INSERT INTO "auth_permission" VALUES(102,26,'change_orderstatuslog','Can change Лог статуса заказа');
INSERT INTO "auth_permission" VALUES(103,26,'delete_orderstatuslog','Can delete Лог статуса заказа');
INSERT INTO "auth_permission" VALUES(104,26,'view_orderstatuslog','Can view Лог статуса заказа');
INSERT INTO "auth_permission" VALUES(105,27,'add_article','Can add Статья');
INSERT INTO "auth_permission" VALUES(106,27,'change_article','Can change Статья');
INSERT INTO "auth_permission" VALUES(107,27,'delete_article','Can delete Статья');
INSERT INTO "auth_permission" VALUES(108,27,'view_article','Can view Статья');
INSERT INTO "auth_permission" VALUES(109,27,'can_publish','Может публиковать статьи');
INSERT INTO "auth_permission" VALUES(110,27,'can_edit_all','Может редактировать все статьи');
CREATE TABLE "blog_article" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "title" varchar(200) NOT NULL, "image" varchar(100) NOT NULL, "image_caption" varchar(200) NOT NULL, "content" text NOT NULL, "published_date" datetime NOT NULL, "is_published" bool NOT NULL, "author_id" bigint NOT NULL REFERENCES "users_user" ("id") DEFERRABLE INITIALLY DEFERRED);
INSERT INTO "blog_article" VALUES(1,'Как ухаживать за обувью.','blog/articles/новость1.png','','<p><strong>Как правильно ухаживать за обувью: советы для долговечности и опрятного вида &nbsp;</strong></p>

<p><strong>Обувь </strong>&mdash; важная часть гардероба, которая влияет не только на комфорт, но и на общий стиль. Чтобы ботинки, туфли или кроссовки служили долго и выглядели ухоженно, за ними нужно правильно ухаживать. В этой статье &mdash; основные правила ухода за разными видами обуви. &nbsp;</p>

<p>&nbsp;1. <em>Основные правила ухода за любой обувью &nbsp;</em></p>

<p>&nbsp;1.1. Регулярная чистка &nbsp;<br />
Грязь, пыль и влага разрушают материал, поэтому обувь нужно чистить после каждой носки: &nbsp;<br />
- Кожаную &mdash; протирать влажной тряпкой и сухой салфеткой. &nbsp;<br />
- Замшевую и нубук &mdash; обрабатывать щеткой с мягким ворсом. &nbsp;<br />
- Текстильную &mdash; удалять загрязнения мягкой щеткой или губкой. &nbsp;</p>

<p>&nbsp;1.2. Сушка &nbsp;<br />
Мокрая обувь деформируется и теряет форму. Правила сушки: &nbsp;<br />
- Не сушить на батарее или под прямыми лучами солнца &mdash; это приводит к растрескиванию. &nbsp;<br />
- Использовать специальные сушилки или набивать обувь бумагой/тканью. &nbsp;<br />
- Для ускорения сушки можно положить внутрь мешочки с силикагелем. &nbsp;</p>

<p>&nbsp;1.3. Хранение &nbsp;<br />
- Хранить в проветриваемом месте, желательно в коробках или на полках. &nbsp;<br />
- Использовать распорки для сохранения формы. &nbsp;<br />
- Не складывать одну пару на другую &mdash; это может привести к деформации. &nbsp;</p>

<p>&nbsp;2.<em> Уход за разными материалами &nbsp;</em></p>

<p>&nbsp;2.1. Кожаная обувь &nbsp;<br />
- Чистить специальными средствами (кремами, спреями) в зависимости от типа кожи. &nbsp;<br />
- Полировать замшу и нубук специальными щетками. &nbsp;<br />
- Обрабатывать водоотталкивающими пропитками. &nbsp;</p>

<p>&nbsp;2.2. Замша и нубук &nbsp;<br />
- Чистить резиновой или латексной щеткой. &nbsp;<br />
- Использовать специальные спреи для защиты от воды. &nbsp;<br />
- Не допускать сильного намокания &mdash; могут остаться разводы. &nbsp;</p>

<p>&nbsp;2.3. Текстиль и кроссовки &nbsp;<br />
- Стирать вручную или в машинке (если позволяет производитель). &nbsp;<br />
- Использовать мягкие моющие средства. &nbsp;<br />
- Сушить без нагрева, чтобы клей не разрушался. &nbsp;</p>

<p>&nbsp;2.4. Резиновая и латексная обувь &nbsp;<br />
- Мыть с мыльным раствором. &nbsp;<br />
- Избегать контакта с маслами и химикатами &mdash; они могут разъедать материал. &nbsp;</p>

<p>&nbsp;3.<em> Уход за подошвой и стельками &nbsp;</em><br />
- Очищать подошву от грязи и камешков, чтобы не стирался протектор. &nbsp;<br />
- Менять стельки каждые 3&ndash;6 месяцев или стирать их, если они текстильные. &nbsp;<br />
- Для кожаной подошвы использовать специальные защитные спреи от скольжения. &nbsp;</p>

<p>&nbsp;4. <em>Защита от запаха &nbsp;</em><br />
- Использовать дезодоранты для обуви. &nbsp;<br />
- Проветривать после носки. &nbsp;<br />
- Класть внутрь мешочки с лавандой или активированным углем. &nbsp;</p>

<p>&nbsp;5. <em>Когда отдавать обувь в ремонт?</em> &nbsp;<br />
- Если оторвана подошва или требуется набойка. &nbsp;<br />
- При сильном истирании каблука. &nbsp;<br />
- Если разошлись швы &mdash; лучше сразу зашить, чтобы не усугубить повреждение. &nbsp;</p>

<h2><strong>Вывод</strong><br />
Правильный уход за обувью продлевает ее срок службы на годы. Достаточно регулярно чистить, сушить и обрабатывать пару в зависимости от материала &mdash; и она будет выглядеть как новая даже после активной носки. &nbsp;</h2>

<p>Ухаживайте за своей обувью, и она будет радовать вас комфортом и стильным видом!<br />
&nbsp;</p>','2025-06-05 11:31:16',1,3);
INSERT INTO "blog_article" VALUES(2,'Как выбрать кроссовки.','blog/articles/новость2.jpg','','<h3>Почему выбор кроссовок так важен</h3>

<p>Каждый день наши ноги выдерживают тысячи шагов. Неправильно подобранные кроссовки могут вызвать боли в спине, натёртости и даже деформации стоп. Хорошие повседневные кроссовки &mdash; это не роскошь, а необходимость.</p>

<hr />
<h3>📏 Как правильно выбрать размер</h3>

<ul>
	<li>
	<p><strong>Меряйте обувь вечером.</strong> Ноги немного отекают в течение дня.</p>
	</li>
	<li>
	<p><strong>Носите носки той толщины, с которыми планируете носить обувь.</strong></p>
	</li>
	<li>
	<p><strong>Оставляйте 0.5&ndash;1 см пространства перед пальцами.</strong> Это обеспечит комфорт при ходьбе.</p>
	</li>
</ul>

<hr />
<h3>🧵 Материалы: за что стоит платить</h3>

<ul>
	<li>
	<p><strong>Кожа:</strong> прочна, но не всегда хорошо дышит.</p>
	</li>
	<li>
	<p><strong>Текстиль:</strong> лёгкий и воздухопроницаемый, но быстрее изнашивается.</p>
	</li>
	<li>
	<p><strong>Сетка (mesh):</strong> отличная вентиляция, особенно летом.</p>
	</li>
</ul>

<p>👉 <strong>Совет:</strong> ищите модели с комбинированными материалами &mdash; они дышат, но сохраняют форму.</p>

<hr />
<h3>🦶 Подошва и амортизация</h3>

<ul>
	<li>
	<p><strong>ЭВА (EVA)</strong> &mdash; лёгкая и упругая, чаще всего используется в спортивной обуви.</p>
	</li>
	<li>
	<p><strong>Резина</strong> &mdash; долговечна, но тяжелее.</p>
	</li>
	<li>
	<p><strong>Амортизация в пятке и носке</strong> снижает нагрузку на суставы.</p>
	</li>
</ul>

<hr />
<h3>🧍 Форма стопы и пронация</h3>

<p>Если у вас плоскостопие или избыточная пронация (провал стопы внутрь), выбирайте <strong>кроссовки с поддержкой свода</strong> или с ортопедической стелькой.</p>

<hr />
<h3>🎨 Стиль тоже важен</h3>

<p>Сегодня повседневные кроссовки &mdash; это часть образа:</p>

<ul>
	<li>
	<p>Универсальный белый подойдёт под любую одежду</p>
	</li>
	<li>
	<p>Монохром чёрный &mdash; практично и стильно</p>
	</li>
	<li>
	<p>Цветные акценты &mdash; для ярких личностей</p>
	</li>
</ul>

<hr />
<h3>✅ Чек-лист перед покупкой</h3>

<ul>
	<li>
	<p>Удобно ли с первого шага?</p>
	</li>
	<li>
	<p>Не давят ли швы?</p>
	</li>
	<li>
	<p>Подходит ли под ваш стиль одежды?</p>
	</li>
	<li>
	<p>Поддерживает ли стопу?&nbsp;</p>
	</li>
</ul>

<hr />
<h3>📌 Вывод</h3>

<p>Выбор идеальных кроссовок &mdash; это баланс между комфортом, качеством и стилем. Потратьте немного времени на выбор &mdash; и ваши ноги скажут вам &laquo;спасибо&raquo;.</p>','2025-06-05 12:04:48.139000',1,3);
INSERT INTO "blog_article" VALUES(3,'Топ-7 моделей обуви.','blog/articles/новость3.jpg','','<h3><strong>Описание:</strong><br />
Минимальный, но стильный гардероб обуви &mdash; это реально. Подборка из 7 универсальных моделей для мужчин и женщин, которые подойдут под большинство образов.</h3>

<p><strong>Ключевые модели:</strong></p>

<ul>
	<li>
	<p>Белые кроссовки</p>
	</li>
	<li>
	<p>Классические лоферы</p>
	</li>
	<li>
	<p>Чёрные ботинки на осень-зиму</p>
	</li>
	<li>
	<p>Пара для выхода &mdash; туфли/броги и др.</p>
	</li>
</ul>','2025-06-05 12:05:44.173000',1,3);
CREATE TABLE "custom_admin_orderstatuslog" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "old_status" varchar(20) NOT NULL, "new_status" varchar(20) NOT NULL, "changed_at" datetime NOT NULL, "changed_by_id" bigint NULL REFERENCES "users_user" ("id") DEFERRABLE INITIALLY DEFERRED, "order_id" bigint NOT NULL REFERENCES "orders_order" ("id") DEFERRABLE INITIALLY DEFERRED);
CREATE TABLE "django_admin_log" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "object_id" text NULL, "object_repr" varchar(200) NOT NULL, "action_flag" smallint unsigned NOT NULL CHECK ("action_flag" >= 0), "change_message" text NOT NULL, "content_type_id" integer NULL REFERENCES "django_content_type" ("id") DEFERRABLE INITIALLY DEFERRED, "user_id" bigint NOT NULL REFERENCES "users_user" ("id") DEFERRABLE INITIALLY DEFERRED, "action_time" datetime NOT NULL);
INSERT INTO "django_admin_log" VALUES(1,'1','Женская обувь',1,'[{"added": {}}]',18,2,'2025-06-05 09:57:57.534000');
INSERT INTO "django_admin_log" VALUES(2,'1','Босоножки',1,'[{"added": {}}]',24,2,'2025-06-05 09:58:09.231000');
INSERT INTO "django_admin_log" VALUES(3,'1','Босоножки на каблуке "Элеганс"',1,'[{"added": {}}, {"added": {"name": "\u0414\u043e\u0441\u0442\u0443\u043f\u043d\u044b\u0439 \u0440\u0430\u0437\u043c\u0435\u0440", "object": "\u0411\u043e\u0441\u043e\u043d\u043e\u0436\u043a\u0438 \u043d\u0430 \u043a\u0430\u0431\u043b\u0443\u043a\u0435 \"\u042d\u043b\u0435\u0433\u0430\u043d\u0441\" - 36 (\u0412 \u043d\u0430\u043b\u0438\u0447\u0438\u0438)"}}, {"added": {"name": "\u0414\u043e\u0441\u0442\u0443\u043f\u043d\u044b\u0439 \u0440\u0430\u0437\u043c\u0435\u0440", "object": "\u0411\u043e\u0441\u043e\u043d\u043e\u0436\u043a\u0438 \u043d\u0430 \u043a\u0430\u0431\u043b\u0443\u043a\u0435 \"\u042d\u043b\u0435\u0433\u0430\u043d\u0441\" - 37 (\u0412 \u043d\u0430\u043b\u0438\u0447\u0438\u0438)"}}, {"added": {"name": "\u0414\u043e\u0441\u0442\u0443\u043f\u043d\u044b\u0439 \u0440\u0430\u0437\u043c\u0435\u0440", "object": "\u0411\u043e\u0441\u043e\u043d\u043e\u0436\u043a\u0438 \u043d\u0430 \u043a\u0430\u0431\u043b\u0443\u043a\u0435 \"\u042d\u043b\u0435\u0433\u0430\u043d\u0441\" - 38 (\u0412 \u043d\u0430\u043b\u0438\u0447\u0438\u0438)"}}, {"added": {"name": "\u0414\u043e\u0441\u0442\u0443\u043f\u043d\u044b\u0439 \u0440\u0430\u0437\u043c\u0435\u0440", "object": "\u0411\u043e\u0441\u043e\u043d\u043e\u0436\u043a\u0438 \u043d\u0430 \u043a\u0430\u0431\u043b\u0443\u043a\u0435 \"\u042d\u043b\u0435\u0433\u0430\u043d\u0441\" - 40 (\u0412 \u043d\u0430\u043b\u0438\u0447\u0438\u0438)"}}, {"added": {"name": "\u0414\u043e\u0441\u0442\u0443\u043f\u043d\u044b\u0439 \u0440\u0430\u0437\u043c\u0435\u0440", "object": "\u0411\u043e\u0441\u043e\u043d\u043e\u0436\u043a\u0438 \u043d\u0430 \u043a\u0430\u0431\u043b\u0443\u043a\u0435 \"\u042d\u043b\u0435\u0433\u0430\u043d\u0441\" - 42 (\u0412 \u043d\u0430\u043b\u0438\u0447\u0438\u0438)"}}, {"added": {"name": "product image", "object": "\u0418\u0437\u043e\u0431\u0440\u0430\u0436\u0435\u043d\u0438\u0435 \u0434\u043b\u044f \u0411\u043e\u0441\u043e\u043d\u043e\u0436\u043a\u0438 \u043d\u0430 \u043a\u0430\u0431\u043b\u0443\u043a\u0435 \"\u042d\u043b\u0435\u0433\u0430\u043d\u0441\""}}, {"added": {"name": "product image", "object": "\u0418\u0437\u043e\u0431\u0440\u0430\u0436\u0435\u043d\u0438\u0435 \u0434\u043b\u044f \u0411\u043e\u0441\u043e\u043d\u043e\u0436\u043a\u0438 \u043d\u0430 \u043a\u0430\u0431\u043b\u0443\u043a\u0435 \"\u042d\u043b\u0435\u0433\u0430\u043d\u0441\""}}]',20,2,'2025-06-05 10:00:47.566000');
INSERT INTO "django_admin_log" VALUES(4,'2','Кроссовки',1,'[{"added": {}}]',24,2,'2025-06-05 10:07:52.908000');
INSERT INTO "django_admin_log" VALUES(5,'2','Кроссовки "Спорт-Лайт"',1,'[{"added": {}}, {"added": {"name": "\u0414\u043e\u0441\u0442\u0443\u043f\u043d\u044b\u0439 \u0440\u0430\u0437\u043c\u0435\u0440", "object": "\u041a\u0440\u043e\u0441\u0441\u043e\u0432\u043a\u0438 \"\u0421\u043f\u043e\u0440\u0442-\u041b\u0430\u0439\u0442\" - 36 (\u0412 \u043d\u0430\u043b\u0438\u0447\u0438\u0438)"}}, {"added": {"name": "\u0414\u043e\u0441\u0442\u0443\u043f\u043d\u044b\u0439 \u0440\u0430\u0437\u043c\u0435\u0440", "object": "\u041a\u0440\u043e\u0441\u0441\u043e\u0432\u043a\u0438 \"\u0421\u043f\u043e\u0440\u0442-\u041b\u0430\u0439\u0442\" - 37 (\u0412 \u043d\u0430\u043b\u0438\u0447\u0438\u0438)"}}, {"added": {"name": "product image", "object": "\u0418\u0437\u043e\u0431\u0440\u0430\u0436\u0435\u043d\u0438\u0435 \u0434\u043b\u044f \u041a\u0440\u043e\u0441\u0441\u043e\u0432\u043a\u0438 \"\u0421\u043f\u043e\u0440\u0442-\u041b\u0430\u0439\u0442\""}}]',20,2,'2025-06-05 10:09:06.041000');
INSERT INTO "django_admin_log" VALUES(6,'3','зимняя обувь',1,'[{"added": {}}]',24,2,'2025-06-05 10:10:55.670000');
INSERT INTO "django_admin_log" VALUES(7,'3','Зимняя сказка',1,'[{"added": {}}, {"added": {"name": "\u0414\u043e\u0441\u0442\u0443\u043f\u043d\u044b\u0439 \u0440\u0430\u0437\u043c\u0435\u0440", "object": "\u0417\u0438\u043c\u043d\u044f\u044f \u0441\u043a\u0430\u0437\u043a\u0430 - 37 (\u0412 \u043d\u0430\u043b\u0438\u0447\u0438\u0438)"}}, {"added": {"name": "product image", "object": "\u0418\u0437\u043e\u0431\u0440\u0430\u0436\u0435\u043d\u0438\u0435 \u0434\u043b\u044f \u0417\u0438\u043c\u043d\u044f\u044f \u0441\u043a\u0430\u0437\u043a\u0430"}}, {"added": {"name": "product image", "object": "\u0418\u0437\u043e\u0431\u0440\u0430\u0436\u0435\u043d\u0438\u0435 \u0434\u043b\u044f \u0417\u0438\u043c\u043d\u044f\u044f \u0441\u043a\u0430\u0437\u043a\u0430"}}, {"added": {"name": "product image", "object": "\u0418\u0437\u043e\u0431\u0440\u0430\u0436\u0435\u043d\u0438\u0435 \u0434\u043b\u044f \u0417\u0438\u043c\u043d\u044f\u044f \u0441\u043a\u0430\u0437\u043a\u0430"}}]',20,2,'2025-06-05 10:12:06.318000');
INSERT INTO "django_admin_log" VALUES(8,'4','балетки',1,'[{"added": {}}]',24,2,'2025-06-05 10:12:58.705000');
INSERT INTO "django_admin_log" VALUES(9,'4','Балетки "Комфорт"',1,'[{"added": {}}, {"added": {"name": "\u0414\u043e\u0441\u0442\u0443\u043f\u043d\u044b\u0439 \u0440\u0430\u0437\u043c\u0435\u0440", "object": "\u0411\u0430\u043b\u0435\u0442\u043a\u0438 \"\u041a\u043e\u043c\u0444\u043e\u0440\u0442\" - 36 (\u0412 \u043d\u0430\u043b\u0438\u0447\u0438\u0438)"}}, {"added": {"name": "\u0414\u043e\u0441\u0442\u0443\u043f\u043d\u044b\u0439 \u0440\u0430\u0437\u043c\u0435\u0440", "object": "\u0411\u0430\u043b\u0435\u0442\u043a\u0438 \"\u041a\u043e\u043c\u0444\u043e\u0440\u0442\" - 37 (\u0412 \u043d\u0430\u043b\u0438\u0447\u0438\u0438)"}}, {"added": {"name": "\u0414\u043e\u0441\u0442\u0443\u043f\u043d\u044b\u0439 \u0440\u0430\u0437\u043c\u0435\u0440", "object": "\u0411\u0430\u043b\u0435\u0442\u043a\u0438 \"\u041a\u043e\u043c\u0444\u043e\u0440\u0442\" - 38 (\u0412 \u043d\u0430\u043b\u0438\u0447\u0438\u0438)"}}, {"added": {"name": "product image", "object": "\u0418\u0437\u043e\u0431\u0440\u0430\u0436\u0435\u043d\u0438\u0435 \u0434\u043b\u044f \u0411\u0430\u043b\u0435\u0442\u043a\u0438 \"\u041a\u043e\u043c\u0444\u043e\u0440\u0442\""}}, {"added": {"name": "product image", "object": "\u0418\u0437\u043e\u0431\u0440\u0430\u0436\u0435\u043d\u0438\u0435 \u0434\u043b\u044f \u0411\u0430\u043b\u0435\u0442\u043a\u0438 \"\u041a\u043e\u043c\u0444\u043e\u0440\u0442\""}}, {"added": {"name": "product image", "object": "\u0418\u0437\u043e\u0431\u0440\u0430\u0436\u0435\u043d\u0438\u0435 \u0434\u043b\u044f \u0411\u0430\u043b\u0435\u0442\u043a\u0438 \"\u041a\u043e\u043c\u0444\u043e\u0440\u0442\""}}]',20,2,'2025-06-05 10:13:56.857000');
INSERT INTO "django_admin_log" VALUES(10,'5','ботфорты',1,'[{"added": {}}]',24,2,'2025-06-05 10:14:42.218000');
INSERT INTO "django_admin_log" VALUES(11,'5','Ботфорты "Грация"',1,'[{"added": {}}, {"added": {"name": "\u0414\u043e\u0441\u0442\u0443\u043f\u043d\u044b\u0439 \u0440\u0430\u0437\u043c\u0435\u0440", "object": "\u0411\u043e\u0442\u0444\u043e\u0440\u0442\u044b \"\u0413\u0440\u0430\u0446\u0438\u044f\" - 38 (\u0412 \u043d\u0430\u043b\u0438\u0447\u0438\u0438)"}}, {"added": {"name": "\u0414\u043e\u0441\u0442\u0443\u043f\u043d\u044b\u0439 \u0440\u0430\u0437\u043c\u0435\u0440", "object": "\u0411\u043e\u0442\u0444\u043e\u0440\u0442\u044b \"\u0413\u0440\u0430\u0446\u0438\u044f\" - 39 (\u0412 \u043d\u0430\u043b\u0438\u0447\u0438\u0438)"}}, {"added": {"name": "product image", "object": "\u0418\u0437\u043e\u0431\u0440\u0430\u0436\u0435\u043d\u0438\u0435 \u0434\u043b\u044f \u0411\u043e\u0442\u0444\u043e\u0440\u0442\u044b \"\u0413\u0440\u0430\u0446\u0438\u044f\""}}, {"added": {"name": "product image", "object": "\u0418\u0437\u043e\u0431\u0440\u0430\u0436\u0435\u043d\u0438\u0435 \u0434\u043b\u044f \u0411\u043e\u0442\u0444\u043e\u0440\u0442\u044b \"\u0413\u0440\u0430\u0446\u0438\u044f\""}}]',20,2,'2025-06-05 10:15:27.256000');
INSERT INTO "django_admin_log" VALUES(12,'6','сандалии',1,'[{"added": {}}]',24,2,'2025-06-05 10:17:03.624000');
INSERT INTO "django_admin_log" VALUES(13,'6','Сандалии "Лето-2024"',1,'[{"added": {}}, {"added": {"name": "\u0414\u043e\u0441\u0442\u0443\u043f\u043d\u044b\u0439 \u0440\u0430\u0437\u043c\u0435\u0440", "object": "\u0421\u0430\u043d\u0434\u0430\u043b\u0438\u0438 \"\u041b\u0435\u0442\u043e-2024\" - 36 (\u0412 \u043d\u0430\u043b\u0438\u0447\u0438\u0438)"}}, {"added": {"name": "\u0414\u043e\u0441\u0442\u0443\u043f\u043d\u044b\u0439 \u0440\u0430\u0437\u043c\u0435\u0440", "object": "\u0421\u0430\u043d\u0434\u0430\u043b\u0438\u0438 \"\u041b\u0435\u0442\u043e-2024\" - 37 (\u0412 \u043d\u0430\u043b\u0438\u0447\u0438\u0438)"}}, {"added": {"name": "\u0414\u043e\u0441\u0442\u0443\u043f\u043d\u044b\u0439 \u0440\u0430\u0437\u043c\u0435\u0440", "object": "\u0421\u0430\u043d\u0434\u0430\u043b\u0438\u0438 \"\u041b\u0435\u0442\u043e-2024\" - 38 (\u0412 \u043d\u0430\u043b\u0438\u0447\u0438\u0438)"}}, {"added": {"name": "\u0414\u043e\u0441\u0442\u0443\u043f\u043d\u044b\u0439 \u0440\u0430\u0437\u043c\u0435\u0440", "object": "\u0421\u0430\u043d\u0434\u0430\u043b\u0438\u0438 \"\u041b\u0435\u0442\u043e-2024\" - 39 (\u0412 \u043d\u0430\u043b\u0438\u0447\u0438\u0438)"}}, {"added": {"name": "product image", "object": "\u0418\u0437\u043e\u0431\u0440\u0430\u0436\u0435\u043d\u0438\u0435 \u0434\u043b\u044f \u0421\u0430\u043d\u0434\u0430\u043b\u0438\u0438 \"\u041b\u0435\u0442\u043e-2024\""}}, {"added": {"name": "product image", "object": "\u0418\u0437\u043e\u0431\u0440\u0430\u0436\u0435\u043d\u0438\u0435 \u0434\u043b\u044f \u0421\u0430\u043d\u0434\u0430\u043b\u0438\u0438 \"\u041b\u0435\u0442\u043e-2024\""}}]',20,2,'2025-06-05 10:17:10.786000');
INSERT INTO "django_admin_log" VALUES(14,'7','лодочки',1,'[{"added": {}}]',24,2,'2025-06-05 10:18:53.518000');
INSERT INTO "django_admin_log" VALUES(15,'7','Туфли "Офисный стиль"',1,'[{"added": {}}, {"added": {"name": "\u0414\u043e\u0441\u0442\u0443\u043f\u043d\u044b\u0439 \u0440\u0430\u0437\u043c\u0435\u0440", "object": "\u0422\u0443\u0444\u043b\u0438 \"\u041e\u0444\u0438\u0441\u043d\u044b\u0439 \u0441\u0442\u0438\u043b\u044c\" - 36 (\u0412 \u043d\u0430\u043b\u0438\u0447\u0438\u0438)"}}, {"added": {"name": "\u0414\u043e\u0441\u0442\u0443\u043f\u043d\u044b\u0439 \u0440\u0430\u0437\u043c\u0435\u0440", "object": "\u0422\u0443\u0444\u043b\u0438 \"\u041e\u0444\u0438\u0441\u043d\u044b\u0439 \u0441\u0442\u0438\u043b\u044c\" - 37 (\u0412 \u043d\u0430\u043b\u0438\u0447\u0438\u0438)"}}, {"added": {"name": "product image", "object": "\u0418\u0437\u043e\u0431\u0440\u0430\u0436\u0435\u043d\u0438\u0435 \u0434\u043b\u044f \u0422\u0443\u0444\u043b\u0438 \"\u041e\u0444\u0438\u0441\u043d\u044b\u0439 \u0441\u0442\u0438\u043b\u044c\""}}, {"added": {"name": "product image", "object": "\u0418\u0437\u043e\u0431\u0440\u0430\u0436\u0435\u043d\u0438\u0435 \u0434\u043b\u044f \u0422\u0443\u0444\u043b\u0438 \"\u041e\u0444\u0438\u0441\u043d\u044b\u0439 \u0441\u0442\u0438\u043b\u044c\""}}, {"added": {"name": "product image", "object": "\u0418\u0437\u043e\u0431\u0440\u0430\u0436\u0435\u043d\u0438\u0435 \u0434\u043b\u044f \u0422\u0443\u0444\u043b\u0438 \"\u041e\u0444\u0438\u0441\u043d\u044b\u0439 \u0441\u0442\u0438\u043b\u044c\""}}]',20,2,'2025-06-05 10:19:48.443000');
INSERT INTO "django_admin_log" VALUES(16,'8','угги',1,'[{"added": {}}]',24,2,'2025-06-05 10:20:33.636000');
INSERT INTO "django_admin_log" VALUES(17,'8','Угги "Мягкие"',1,'[{"added": {}}, {"added": {"name": "\u0414\u043e\u0441\u0442\u0443\u043f\u043d\u044b\u0439 \u0440\u0430\u0437\u043c\u0435\u0440", "object": "\u0423\u0433\u0433\u0438 \"\u041c\u044f\u0433\u043a\u0438\u0435\" - 37 (\u0412 \u043d\u0430\u043b\u0438\u0447\u0438\u0438)"}}, {"added": {"name": "\u0414\u043e\u0441\u0442\u0443\u043f\u043d\u044b\u0439 \u0440\u0430\u0437\u043c\u0435\u0440", "object": "\u0423\u0433\u0433\u0438 \"\u041c\u044f\u0433\u043a\u0438\u0435\" - 38 (\u0412 \u043d\u0430\u043b\u0438\u0447\u0438\u0438)"}}, {"added": {"name": "\u0414\u043e\u0441\u0442\u0443\u043f\u043d\u044b\u0439 \u0440\u0430\u0437\u043c\u0435\u0440", "object": "\u0423\u0433\u0433\u0438 \"\u041c\u044f\u0433\u043a\u0438\u0435\" - 39 (\u0412 \u043d\u0430\u043b\u0438\u0447\u0438\u0438)"}}, {"added": {"name": "product image", "object": "\u0418\u0437\u043e\u0431\u0440\u0430\u0436\u0435\u043d\u0438\u0435 \u0434\u043b\u044f \u0423\u0433\u0433\u0438 \"\u041c\u044f\u0433\u043a\u0438\u0435\""}}, {"added": {"name": "product image", "object": "\u0418\u0437\u043e\u0431\u0440\u0430\u0436\u0435\u043d\u0438\u0435 \u0434\u043b\u044f \u0423\u0433\u0433\u0438 \"\u041c\u044f\u0433\u043a\u0438\u0435\""}}, {"added": {"name": "product image", "object": "\u0418\u0437\u043e\u0431\u0440\u0430\u0436\u0435\u043d\u0438\u0435 \u0434\u043b\u044f \u0423\u0433\u0433\u0438 \"\u041c\u044f\u0433\u043a\u0438\u0435\""}}]',20,2,'2025-06-05 10:21:35.231000');
INSERT INTO "django_admin_log" VALUES(18,'9','кеды',1,'[{"added": {}}]',24,2,'2025-06-05 10:22:14.555000');
INSERT INTO "django_admin_log" VALUES(19,'9','Кеды "Ретро"',1,'[{"added": {}}, {"added": {"name": "\u0414\u043e\u0441\u0442\u0443\u043f\u043d\u044b\u0439 \u0440\u0430\u0437\u043c\u0435\u0440", "object": "\u041a\u0435\u0434\u044b \"\u0420\u0435\u0442\u0440\u043e\" - 37 (\u0412 \u043d\u0430\u043b\u0438\u0447\u0438\u0438)"}}, {"added": {"name": "\u0414\u043e\u0441\u0442\u0443\u043f\u043d\u044b\u0439 \u0440\u0430\u0437\u043c\u0435\u0440", "object": "\u041a\u0435\u0434\u044b \"\u0420\u0435\u0442\u0440\u043e\" - 39 (\u0412 \u043d\u0430\u043b\u0438\u0447\u0438\u0438)"}}, {"added": {"name": "product image", "object": "\u0418\u0437\u043e\u0431\u0440\u0430\u0436\u0435\u043d\u0438\u0435 \u0434\u043b\u044f \u041a\u0435\u0434\u044b \"\u0420\u0435\u0442\u0440\u043e\""}}, {"added": {"name": "product image", "object": "\u0418\u0437\u043e\u0431\u0440\u0430\u0436\u0435\u043d\u0438\u0435 \u0434\u043b\u044f \u041a\u0435\u0434\u044b \"\u0420\u0435\u0442\u0440\u043e\""}}, {"added": {"name": "product image", "object": "\u0418\u0437\u043e\u0431\u0440\u0430\u0436\u0435\u043d\u0438\u0435 \u0434\u043b\u044f \u041a\u0435\u0434\u044b \"\u0420\u0435\u0442\u0440\u043e\""}}]',20,2,'2025-06-05 10:23:00.303000');
INSERT INTO "django_admin_log" VALUES(20,'10','сабо',1,'[{"added": {}}]',24,2,'2025-06-05 10:23:31.711000');
INSERT INTO "django_admin_log" VALUES(21,'10','Сабо "Домашние"',1,'[{"added": {}}, {"added": {"name": "\u0414\u043e\u0441\u0442\u0443\u043f\u043d\u044b\u0439 \u0440\u0430\u0437\u043c\u0435\u0440", "object": "\u0421\u0430\u0431\u043e \"\u0414\u043e\u043c\u0430\u0448\u043d\u0438\u0435\" - 38 (\u0412 \u043d\u0430\u043b\u0438\u0447\u0438\u0438)"}}, {"added": {"name": "\u0414\u043e\u0441\u0442\u0443\u043f\u043d\u044b\u0439 \u0440\u0430\u0437\u043c\u0435\u0440", "object": "\u0421\u0430\u0431\u043e \"\u0414\u043e\u043c\u0430\u0448\u043d\u0438\u0435\" - 39 (\u0412 \u043d\u0430\u043b\u0438\u0447\u0438\u0438)"}}, {"added": {"name": "product image", "object": "\u0418\u0437\u043e\u0431\u0440\u0430\u0436\u0435\u043d\u0438\u0435 \u0434\u043b\u044f \u0421\u0430\u0431\u043e \"\u0414\u043e\u043c\u0430\u0448\u043d\u0438\u0435\""}}, {"added": {"name": "product image", "object": "\u0418\u0437\u043e\u0431\u0440\u0430\u0436\u0435\u043d\u0438\u0435 \u0434\u043b\u044f \u0421\u0430\u0431\u043e \"\u0414\u043e\u043c\u0430\u0448\u043d\u0438\u0435\""}}]',20,2,'2025-06-05 10:24:19.091000');
INSERT INTO "django_admin_log" VALUES(22,'11','ботильоны',1,'[{"added": {}}]',24,2,'2025-06-05 10:25:07.046000');
INSERT INTO "django_admin_log" VALUES(23,'11','Ботильоны "Гранд"',1,'[{"added": {}}, {"added": {"name": "\u0414\u043e\u0441\u0442\u0443\u043f\u043d\u044b\u0439 \u0440\u0430\u0437\u043c\u0435\u0440", "object": "\u0411\u043e\u0442\u0438\u043b\u044c\u043e\u043d\u044b \"\u0413\u0440\u0430\u043d\u0434\" - 38 (\u0412 \u043d\u0430\u043b\u0438\u0447\u0438\u0438)"}}, {"added": {"name": "\u0414\u043e\u0441\u0442\u0443\u043f\u043d\u044b\u0439 \u0440\u0430\u0437\u043c\u0435\u0440", "object": "\u0411\u043e\u0442\u0438\u043b\u044c\u043e\u043d\u044b \"\u0413\u0440\u0430\u043d\u0434\" - 39 (\u0412 \u043d\u0430\u043b\u0438\u0447\u0438\u0438)"}}, {"added": {"name": "product image", "object": "\u0418\u0437\u043e\u0431\u0440\u0430\u0436\u0435\u043d\u0438\u0435 \u0434\u043b\u044f \u0411\u043e\u0442\u0438\u043b\u044c\u043e\u043d\u044b \"\u0413\u0440\u0430\u043d\u0434\""}}, {"added": {"name": "product image", "object": "\u0418\u0437\u043e\u0431\u0440\u0430\u0436\u0435\u043d\u0438\u0435 \u0434\u043b\u044f \u0411\u043e\u0442\u0438\u043b\u044c\u043e\u043d\u044b \"\u0413\u0440\u0430\u043d\u0434\""}}]',20,2,'2025-06-05 10:26:10.667000');
INSERT INTO "django_admin_log" VALUES(24,'12','Эспадрильи "Летний бриз"',1,'[{"added": {}}, {"added": {"name": "\u0414\u043e\u0441\u0442\u0443\u043f\u043d\u044b\u0439 \u0440\u0430\u0437\u043c\u0435\u0440", "object": "\u042d\u0441\u043f\u0430\u0434\u0440\u0438\u043b\u044c\u0438 \"\u041b\u0435\u0442\u043d\u0438\u0439 \u0431\u0440\u0438\u0437\" - 36 (\u0412 \u043d\u0430\u043b\u0438\u0447\u0438\u0438)"}}, {"added": {"name": "\u0414\u043e\u0441\u0442\u0443\u043f\u043d\u044b\u0439 \u0440\u0430\u0437\u043c\u0435\u0440", "object": "\u042d\u0441\u043f\u0430\u0434\u0440\u0438\u043b\u044c\u0438 \"\u041b\u0435\u0442\u043d\u0438\u0439 \u0431\u0440\u0438\u0437\" - 37 (\u0412 \u043d\u0430\u043b\u0438\u0447\u0438\u0438)"}}, {"added": {"name": "\u0414\u043e\u0441\u0442\u0443\u043f\u043d\u044b\u0439 \u0440\u0430\u0437\u043c\u0435\u0440", "object": "\u042d\u0441\u043f\u0430\u0434\u0440\u0438\u043b\u044c\u0438 \"\u041b\u0435\u0442\u043d\u0438\u0439 \u0431\u0440\u0438\u0437\" - 38 (\u0412 \u043d\u0430\u043b\u0438\u0447\u0438\u0438)"}}, {"added": {"name": "\u0414\u043e\u0441\u0442\u0443\u043f\u043d\u044b\u0439 \u0440\u0430\u0437\u043c\u0435\u0440", "object": "\u042d\u0441\u043f\u0430\u0434\u0440\u0438\u043b\u044c\u0438 \"\u041b\u0435\u0442\u043d\u0438\u0439 \u0431\u0440\u0438\u0437\" - 39 (\u0412 \u043d\u0430\u043b\u0438\u0447\u0438\u0438)"}}, {"added": {"name": "\u0414\u043e\u0441\u0442\u0443\u043f\u043d\u044b\u0439 \u0440\u0430\u0437\u043c\u0435\u0440", "object": "\u042d\u0441\u043f\u0430\u0434\u0440\u0438\u043b\u044c\u0438 \"\u041b\u0435\u0442\u043d\u0438\u0439 \u0431\u0440\u0438\u0437\" - 40 (\u0412 \u043d\u0430\u043b\u0438\u0447\u0438\u0438)"}}, {"added": {"name": "product image", "object": "\u0418\u0437\u043e\u0431\u0440\u0430\u0436\u0435\u043d\u0438\u0435 \u0434\u043b\u044f \u042d\u0441\u043f\u0430\u0434\u0440\u0438\u043b\u044c\u0438 \"\u041b\u0435\u0442\u043d\u0438\u0439 \u0431\u0440\u0438\u0437\""}}, {"added": {"name": "product image", "object": "\u0418\u0437\u043e\u0431\u0440\u0430\u0436\u0435\u043d\u0438\u0435 \u0434\u043b\u044f \u042d\u0441\u043f\u0430\u0434\u0440\u0438\u043b\u044c\u0438 \"\u041b\u0435\u0442\u043d\u0438\u0439 \u0431\u0440\u0438\u0437\""}}]',20,2,'2025-06-05 10:29:37.194000');
INSERT INTO "django_admin_log" VALUES(25,'13','Сапоги "Снежная королева"',1,'[{"added": {}}, {"added": {"name": "\u0414\u043e\u0441\u0442\u0443\u043f\u043d\u044b\u0439 \u0440\u0430\u0437\u043c\u0435\u0440", "object": "\u0421\u0430\u043f\u043e\u0433\u0438 \"\u0421\u043d\u0435\u0436\u043d\u0430\u044f \u043a\u043e\u0440\u043e\u043b\u0435\u0432\u0430\" - 37 (\u0412 \u043d\u0430\u043b\u0438\u0447\u0438\u0438)"}}, {"added": {"name": "\u0414\u043e\u0441\u0442\u0443\u043f\u043d\u044b\u0439 \u0440\u0430\u0437\u043c\u0435\u0440", "object": "\u0421\u0430\u043f\u043e\u0433\u0438 \"\u0421\u043d\u0435\u0436\u043d\u0430\u044f \u043a\u043e\u0440\u043e\u043b\u0435\u0432\u0430\" - 38 (\u0412 \u043d\u0430\u043b\u0438\u0447\u0438\u0438)"}}, {"added": {"name": "product image", "object": "\u0418\u0437\u043e\u0431\u0440\u0430\u0436\u0435\u043d\u0438\u0435 \u0434\u043b\u044f \u0421\u0430\u043f\u043e\u0433\u0438 \"\u0421\u043d\u0435\u0436\u043d\u0430\u044f \u043a\u043e\u0440\u043e\u043b\u0435\u0432\u0430\""}}, {"added": {"name": "product image", "object": "\u0418\u0437\u043e\u0431\u0440\u0430\u0436\u0435\u043d\u0438\u0435 \u0434\u043b\u044f \u0421\u0430\u043f\u043e\u0433\u0438 \"\u0421\u043d\u0435\u0436\u043d\u0430\u044f \u043a\u043e\u0440\u043e\u043b\u0435\u0432\u0430\""}}]',20,2,'2025-06-05 10:30:54.832000');
INSERT INTO "django_admin_log" VALUES(26,'14','Слипоны "Мини"',1,'[{"added": {}}, {"added": {"name": "\u0414\u043e\u0441\u0442\u0443\u043f\u043d\u044b\u0439 \u0440\u0430\u0437\u043c\u0435\u0440", "object": "\u0421\u043b\u0438\u043f\u043e\u043d\u044b \"\u041c\u0438\u043d\u0438\" - 39 (\u0412 \u043d\u0430\u043b\u0438\u0447\u0438\u0438)"}}, {"added": {"name": "\u0414\u043e\u0441\u0442\u0443\u043f\u043d\u044b\u0439 \u0440\u0430\u0437\u043c\u0435\u0440", "object": "\u0421\u043b\u0438\u043f\u043e\u043d\u044b \"\u041c\u0438\u043d\u0438\" - 37 (\u0412 \u043d\u0430\u043b\u0438\u0447\u0438\u0438)"}}, {"added": {"name": "\u0414\u043e\u0441\u0442\u0443\u043f\u043d\u044b\u0439 \u0440\u0430\u0437\u043c\u0435\u0440", "object": "\u0421\u043b\u0438\u043f\u043e\u043d\u044b \"\u041c\u0438\u043d\u0438\" - 34 (\u0412 \u043d\u0430\u043b\u0438\u0447\u0438\u0438)"}}, {"added": {"name": "product image", "object": "\u0418\u0437\u043e\u0431\u0440\u0430\u0436\u0435\u043d\u0438\u0435 \u0434\u043b\u044f \u0421\u043b\u0438\u043f\u043e\u043d\u044b \"\u041c\u0438\u043d\u0438\""}}, {"added": {"name": "product image", "object": "\u0418\u0437\u043e\u0431\u0440\u0430\u0436\u0435\u043d\u0438\u0435 \u0434\u043b\u044f \u0421\u043b\u0438\u043f\u043e\u043d\u044b \"\u041c\u0438\u043d\u0438\""}}]',20,2,'2025-06-05 10:32:21.978000');
INSERT INTO "django_admin_log" VALUES(27,'15','Мюли "Комфорт+"',1,'[{"added": {}}, {"added": {"name": "\u0414\u043e\u0441\u0442\u0443\u043f\u043d\u044b\u0439 \u0440\u0430\u0437\u043c\u0435\u0440", "object": "\u041c\u044e\u043b\u0438 \"\u041a\u043e\u043c\u0444\u043e\u0440\u0442+\" - 37 (\u0412 \u043d\u0430\u043b\u0438\u0447\u0438\u0438)"}}, {"added": {"name": "product image", "object": "\u0418\u0437\u043e\u0431\u0440\u0430\u0436\u0435\u043d\u0438\u0435 \u0434\u043b\u044f \u041c\u044e\u043b\u0438 \"\u041a\u043e\u043c\u0444\u043e\u0440\u0442+\""}}, {"added": {"name": "product image", "object": "\u0418\u0437\u043e\u0431\u0440\u0430\u0436\u0435\u043d\u0438\u0435 \u0434\u043b\u044f \u041c\u044e\u043b\u0438 \"\u041a\u043e\u043c\u0444\u043e\u0440\u0442+\""}}]',20,2,'2025-06-05 10:34:27.470000');
INSERT INTO "django_admin_log" VALUES(28,'2','мужская обувь',1,'[{"added": {}}]',18,2,'2025-06-05 10:37:23.186000');
INSERT INTO "django_admin_log" VALUES(29,'16','Кроссовки "Ультра-Ран"',1,'[{"added": {}}, {"added": {"name": "\u0414\u043e\u0441\u0442\u0443\u043f\u043d\u044b\u0439 \u0440\u0430\u0437\u043c\u0435\u0440", "object": "\u041a\u0440\u043e\u0441\u0441\u043e\u0432\u043a\u0438 \"\u0423\u043b\u044c\u0442\u0440\u0430-\u0420\u0430\u043d\" - 44 (\u0412 \u043d\u0430\u043b\u0438\u0447\u0438\u0438)"}}, {"added": {"name": "\u0414\u043e\u0441\u0442\u0443\u043f\u043d\u044b\u0439 \u0440\u0430\u0437\u043c\u0435\u0440", "object": "\u041a\u0440\u043e\u0441\u0441\u043e\u0432\u043a\u0438 \"\u0423\u043b\u044c\u0442\u0440\u0430-\u0420\u0430\u043d\" - 42 (\u0412 \u043d\u0430\u043b\u0438\u0447\u0438\u0438)"}}, {"added": {"name": "\u0414\u043e\u0441\u0442\u0443\u043f\u043d\u044b\u0439 \u0440\u0430\u0437\u043c\u0435\u0440", "object": "\u041a\u0440\u043e\u0441\u0441\u043e\u0432\u043a\u0438 \"\u0423\u043b\u044c\u0442\u0440\u0430-\u0420\u0430\u043d\" - 39 (\u0412 \u043d\u0430\u043b\u0438\u0447\u0438\u0438)"}}, {"added": {"name": "\u0414\u043e\u0441\u0442\u0443\u043f\u043d\u044b\u0439 \u0440\u0430\u0437\u043c\u0435\u0440", "object": "\u041a\u0440\u043e\u0441\u0441\u043e\u0432\u043a\u0438 \"\u0423\u043b\u044c\u0442\u0440\u0430-\u0420\u0430\u043d\" - 46 (\u0412 \u043d\u0430\u043b\u0438\u0447\u0438\u0438)"}}, {"added": {"name": "\u0414\u043e\u0441\u0442\u0443\u043f\u043d\u044b\u0439 \u0440\u0430\u0437\u043c\u0435\u0440", "object": "\u041a\u0440\u043e\u0441\u0441\u043e\u0432\u043a\u0438 \"\u0423\u043b\u044c\u0442\u0440\u0430-\u0420\u0430\u043d\" - 38 (\u0412 \u043d\u0430\u043b\u0438\u0447\u0438\u0438)"}}, {"added": {"name": "product image", "object": "\u0418\u0437\u043e\u0431\u0440\u0430\u0436\u0435\u043d\u0438\u0435 \u0434\u043b\u044f \u041a\u0440\u043e\u0441\u0441\u043e\u0432\u043a\u0438 \"\u0423\u043b\u044c\u0442\u0440\u0430-\u0420\u0430\u043d\""}}, {"added": {"name": "product image", "object": "\u0418\u0437\u043e\u0431\u0440\u0430\u0436\u0435\u043d\u0438\u0435 \u0434\u043b\u044f \u041a\u0440\u043e\u0441\u0441\u043e\u0432\u043a\u0438 \"\u0423\u043b\u044c\u0442\u0440\u0430-\u0420\u0430\u043d\""}}]',20,2,'2025-06-05 10:38:37.694000');
INSERT INTO "django_admin_log" VALUES(30,'17','Ботинки "Челленджер"',1,'[{"added": {}}, {"added": {"name": "\u0414\u043e\u0441\u0442\u0443\u043f\u043d\u044b\u0439 \u0440\u0430\u0437\u043c\u0435\u0440", "object": "\u0411\u043e\u0442\u0438\u043d\u043a\u0438 \"\u0427\u0435\u043b\u043b\u0435\u043d\u0434\u0436\u0435\u0440\" - 46 (\u0412 \u043d\u0430\u043b\u0438\u0447\u0438\u0438)"}}, {"added": {"name": "\u0414\u043e\u0441\u0442\u0443\u043f\u043d\u044b\u0439 \u0440\u0430\u0437\u043c\u0435\u0440", "object": "\u0411\u043e\u0442\u0438\u043d\u043a\u0438 \"\u0427\u0435\u043b\u043b\u0435\u043d\u0434\u0436\u0435\u0440\" - 48 (\u0412 \u043d\u0430\u043b\u0438\u0447\u0438\u0438)"}}, {"added": {"name": "product image", "object": "\u0418\u0437\u043e\u0431\u0440\u0430\u0436\u0435\u043d\u0438\u0435 \u0434\u043b\u044f \u0411\u043e\u0442\u0438\u043d\u043a\u0438 \"\u0427\u0435\u043b\u043b\u0435\u043d\u0434\u0436\u0435\u0440\""}}, {"added": {"name": "product image", "object": "\u0418\u0437\u043e\u0431\u0440\u0430\u0436\u0435\u043d\u0438\u0435 \u0434\u043b\u044f \u0411\u043e\u0442\u0438\u043d\u043a\u0438 \"\u0427\u0435\u043b\u043b\u0435\u043d\u0434\u0436\u0435\u0440\""}}, {"added": {"name": "product image", "object": "\u0418\u0437\u043e\u0431\u0440\u0430\u0436\u0435\u043d\u0438\u0435 \u0434\u043b\u044f \u0411\u043e\u0442\u0438\u043d\u043a\u0438 \"\u0427\u0435\u043b\u043b\u0435\u043d\u0434\u0436\u0435\u0440\""}}]',20,2,'2025-06-05 10:42:35.335000');
INSERT INTO "django_admin_log" VALUES(31,'12','офис',1,'[{"added": {}}]',24,2,'2025-06-05 10:43:22.792000');
INSERT INTO "django_admin_log" VALUES(32,'18','Туфли "Офисные"',1,'[{"added": {}}, {"added": {"name": "\u0414\u043e\u0441\u0442\u0443\u043f\u043d\u044b\u0439 \u0440\u0430\u0437\u043c\u0435\u0440", "object": "\u0422\u0443\u0444\u043b\u0438 \"\u041e\u0444\u0438\u0441\u043d\u044b\u0435\" - 44 (\u0412 \u043d\u0430\u043b\u0438\u0447\u0438\u0438)"}}, {"added": {"name": "\u0414\u043e\u0441\u0442\u0443\u043f\u043d\u044b\u0439 \u0440\u0430\u0437\u043c\u0435\u0440", "object": "\u0422\u0443\u0444\u043b\u0438 \"\u041e\u0444\u0438\u0441\u043d\u044b\u0435\" - 46 (\u0412 \u043d\u0430\u043b\u0438\u0447\u0438\u0438)"}}, {"added": {"name": "product image", "object": "\u0418\u0437\u043e\u0431\u0440\u0430\u0436\u0435\u043d\u0438\u0435 \u0434\u043b\u044f \u0422\u0443\u0444\u043b\u0438 \"\u041e\u0444\u0438\u0441\u043d\u044b\u0435\""}}, {"added": {"name": "product image", "object": "\u0418\u0437\u043e\u0431\u0440\u0430\u0436\u0435\u043d\u0438\u0435 \u0434\u043b\u044f \u0422\u0443\u0444\u043b\u0438 \"\u041e\u0444\u0438\u0441\u043d\u044b\u0435\""}}]',20,2,'2025-06-05 10:44:04.701000');
INSERT INTO "django_admin_log" VALUES(33,'19','Сандалии "Кемпинг"',1,'[{"added": {}}, {"added": {"name": "\u0414\u043e\u0441\u0442\u0443\u043f\u043d\u044b\u0439 \u0440\u0430\u0437\u043c\u0435\u0440", "object": "\u0421\u0430\u043d\u0434\u0430\u043b\u0438\u0438 \"\u041a\u0435\u043c\u043f\u0438\u043d\u0433\" - 44 (\u0412 \u043d\u0430\u043b\u0438\u0447\u0438\u0438)"}}, {"added": {"name": "product image", "object": "\u0418\u0437\u043e\u0431\u0440\u0430\u0436\u0435\u043d\u0438\u0435 \u0434\u043b\u044f \u0421\u0430\u043d\u0434\u0430\u043b\u0438\u0438 \"\u041a\u0435\u043c\u043f\u0438\u043d\u0433\""}}, {"added": {"name": "product image", "object": "\u0418\u0437\u043e\u0431\u0440\u0430\u0436\u0435\u043d\u0438\u0435 \u0434\u043b\u044f \u0421\u0430\u043d\u0434\u0430\u043b\u0438\u0438 \"\u041a\u0435\u043c\u043f\u0438\u043d\u0433\""}}]',20,2,'2025-06-05 10:48:26.638000');
INSERT INTO "django_admin_log" VALUES(34,'20','Кеды "Классик"',1,'[{"added": {}}, {"added": {"name": "\u0414\u043e\u0441\u0442\u0443\u043f\u043d\u044b\u0439 \u0440\u0430\u0437\u043c\u0435\u0440", "object": "\u041a\u0435\u0434\u044b \"\u041a\u043b\u0430\u0441\u0441\u0438\u043a\" - 44 (\u0412 \u043d\u0430\u043b\u0438\u0447\u0438\u0438)"}}, {"added": {"name": "\u0414\u043e\u0441\u0442\u0443\u043f\u043d\u044b\u0439 \u0440\u0430\u0437\u043c\u0435\u0440", "object": "\u041a\u0435\u0434\u044b \"\u041a\u043b\u0430\u0441\u0441\u0438\u043a\" - 46 (\u0412 \u043d\u0430\u043b\u0438\u0447\u0438\u0438)"}}, {"added": {"name": "product image", "object": "\u0418\u0437\u043e\u0431\u0440\u0430\u0436\u0435\u043d\u0438\u0435 \u0434\u043b\u044f \u041a\u0435\u0434\u044b \"\u041a\u043b\u0430\u0441\u0441\u0438\u043a\""}}, {"added": {"name": "product image", "object": "\u0418\u0437\u043e\u0431\u0440\u0430\u0436\u0435\u043d\u0438\u0435 \u0434\u043b\u044f \u041a\u0435\u0434\u044b \"\u041a\u043b\u0430\u0441\u0441\u0438\u043a\""}}]',20,2,'2025-06-05 10:49:46.052000');
INSERT INTO "django_admin_log" VALUES(35,'21','Сапоги "Зимний драйв"',1,'[{"added": {}}, {"added": {"name": "\u0414\u043e\u0441\u0442\u0443\u043f\u043d\u044b\u0439 \u0440\u0430\u0437\u043c\u0435\u0440", "object": "\u0421\u0430\u043f\u043e\u0433\u0438 \"\u0417\u0438\u043c\u043d\u0438\u0439 \u0434\u0440\u0430\u0439\u0432\" - 48 (\u0412 \u043d\u0430\u043b\u0438\u0447\u0438\u0438)"}}, {"added": {"name": "product image", "object": "\u0418\u0437\u043e\u0431\u0440\u0430\u0436\u0435\u043d\u0438\u0435 \u0434\u043b\u044f \u0421\u0430\u043f\u043e\u0433\u0438 \"\u0417\u0438\u043c\u043d\u0438\u0439 \u0434\u0440\u0430\u0439\u0432\""}}, {"added": {"name": "product image", "object": "\u0418\u0437\u043e\u0431\u0440\u0430\u0436\u0435\u043d\u0438\u0435 \u0434\u043b\u044f \u0421\u0430\u043f\u043e\u0433\u0438 \"\u0417\u0438\u043c\u043d\u0438\u0439 \u0434\u0440\u0430\u0439\u0432\""}}]',20,2,'2025-06-05 10:51:02.151000');
INSERT INTO "django_admin_log" VALUES(36,'1','Как ухаживать за обувью.',1,'[{"added": {}}]',27,3,'2025-06-05 11:33:14.413000');
INSERT INTO "django_admin_log" VALUES(37,'20','Кеды "Классик"',2,'[{"changed": {"fields": ["Image"]}}, {"changed": {"name": "product image", "object": "\u0418\u0437\u043e\u0431\u0440\u0430\u0436\u0435\u043d\u0438\u0435 \u0434\u043b\u044f \u041a\u0435\u0434\u044b \"\u041a\u043b\u0430\u0441\u0441\u0438\u043a\"", "fields": ["Image"]}}]',20,4,'2025-06-07 12:32:48.457421');
INSERT INTO "django_admin_log" VALUES(38,'21','Сапоги "Зимний драйв"',2,'[{"changed": {"fields": ["Image"]}}, {"changed": {"name": "product image", "object": "\u0418\u0437\u043e\u0431\u0440\u0430\u0436\u0435\u043d\u0438\u0435 \u0434\u043b\u044f \u0421\u0430\u043f\u043e\u0433\u0438 \"\u0417\u0438\u043c\u043d\u0438\u0439 \u0434\u0440\u0430\u0439\u0432\"", "fields": ["Image"]}}, {"changed": {"name": "product image", "object": "\u0418\u0437\u043e\u0431\u0440\u0430\u0436\u0435\u043d\u0438\u0435 \u0434\u043b\u044f \u0421\u0430\u043f\u043e\u0433\u0438 \"\u0417\u0438\u043c\u043d\u0438\u0439 \u0434\u0440\u0430\u0439\u0432\"", "fields": ["Image"]}}]',20,4,'2025-06-07 12:46:10.382008');
INSERT INTO "django_admin_log" VALUES(39,'19','Сандалии "Кемпинг"',2,'[{"changed": {"fields": ["Image"]}}, {"changed": {"name": "product image", "object": "\u0418\u0437\u043e\u0431\u0440\u0430\u0436\u0435\u043d\u0438\u0435 \u0434\u043b\u044f \u0421\u0430\u043d\u0434\u0430\u043b\u0438\u0438 \"\u041a\u0435\u043c\u043f\u0438\u043d\u0433\"", "fields": ["Image"]}}, {"changed": {"name": "product image", "object": "\u0418\u0437\u043e\u0431\u0440\u0430\u0436\u0435\u043d\u0438\u0435 \u0434\u043b\u044f \u0421\u0430\u043d\u0434\u0430\u043b\u0438\u0438 \"\u041a\u0435\u043c\u043f\u0438\u043d\u0433\"", "fields": ["Image"]}}]',20,4,'2025-06-07 12:46:53.470418');
INSERT INTO "django_admin_log" VALUES(40,'18','Туфли "Офисные"',2,'[{"changed": {"fields": ["Image"]}}, {"changed": {"name": "product image", "object": "\u0418\u0437\u043e\u0431\u0440\u0430\u0436\u0435\u043d\u0438\u0435 \u0434\u043b\u044f \u0422\u0443\u0444\u043b\u0438 \"\u041e\u0444\u0438\u0441\u043d\u044b\u0435\"", "fields": ["Image"]}}, {"changed": {"name": "product image", "object": "\u0418\u0437\u043e\u0431\u0440\u0430\u0436\u0435\u043d\u0438\u0435 \u0434\u043b\u044f \u0422\u0443\u0444\u043b\u0438 \"\u041e\u0444\u0438\u0441\u043d\u044b\u0435\"", "fields": ["Image"]}}]',20,4,'2025-06-07 12:47:34.247360');
INSERT INTO "django_admin_log" VALUES(41,'17','Ботинки "Челленджер"',2,'[{"changed": {"fields": ["Image"]}}, {"changed": {"name": "product image", "object": "\u0418\u0437\u043e\u0431\u0440\u0430\u0436\u0435\u043d\u0438\u0435 \u0434\u043b\u044f \u0411\u043e\u0442\u0438\u043d\u043a\u0438 \"\u0427\u0435\u043b\u043b\u0435\u043d\u0434\u0436\u0435\u0440\"", "fields": ["Image"]}}, {"changed": {"name": "product image", "object": "\u0418\u0437\u043e\u0431\u0440\u0430\u0436\u0435\u043d\u0438\u0435 \u0434\u043b\u044f \u0411\u043e\u0442\u0438\u043d\u043a\u0438 \"\u0427\u0435\u043b\u043b\u0435\u043d\u0434\u0436\u0435\u0440\"", "fields": ["Image"]}}, {"changed": {"name": "product image", "object": "\u0418\u0437\u043e\u0431\u0440\u0430\u0436\u0435\u043d\u0438\u0435 \u0434\u043b\u044f \u0411\u043e\u0442\u0438\u043d\u043a\u0438 \"\u0427\u0435\u043b\u043b\u0435\u043d\u0434\u0436\u0435\u0440\"", "fields": ["Image"]}}]',20,4,'2025-06-07 12:49:02.036225');
INSERT INTO "django_admin_log" VALUES(42,'16','Кроссовки "Ультра-Ран"',2,'[{"changed": {"fields": ["Image"]}}, {"changed": {"name": "product image", "object": "\u0418\u0437\u043e\u0431\u0440\u0430\u0436\u0435\u043d\u0438\u0435 \u0434\u043b\u044f \u041a\u0440\u043e\u0441\u0441\u043e\u0432\u043a\u0438 \"\u0423\u043b\u044c\u0442\u0440\u0430-\u0420\u0430\u043d\"", "fields": ["Image"]}}, {"changed": {"name": "product image", "object": "\u0418\u0437\u043e\u0431\u0440\u0430\u0436\u0435\u043d\u0438\u0435 \u0434\u043b\u044f \u041a\u0440\u043e\u0441\u0441\u043e\u0432\u043a\u0438 \"\u0423\u043b\u044c\u0442\u0440\u0430-\u0420\u0430\u043d\"", "fields": ["Image"]}}]',20,4,'2025-06-07 12:49:54.481902');
INSERT INTO "django_admin_log" VALUES(43,'15','Мюли "Комфорт+"',2,'[{"changed": {"fields": ["Image"]}}, {"changed": {"name": "product image", "object": "\u0418\u0437\u043e\u0431\u0440\u0430\u0436\u0435\u043d\u0438\u0435 \u0434\u043b\u044f \u041c\u044e\u043b\u0438 \"\u041a\u043e\u043c\u0444\u043e\u0440\u0442+\"", "fields": ["Image"]}}, {"changed": {"name": "product image", "object": "\u0418\u0437\u043e\u0431\u0440\u0430\u0436\u0435\u043d\u0438\u0435 \u0434\u043b\u044f \u041c\u044e\u043b\u0438 \"\u041a\u043e\u043c\u0444\u043e\u0440\u0442+\"", "fields": ["Image"]}}]',20,4,'2025-06-07 12:50:31.009850');
INSERT INTO "django_admin_log" VALUES(44,'14','Слипоны "Мини"',2,'[{"changed": {"fields": ["Image"]}}, {"changed": {"name": "product image", "object": "\u0418\u0437\u043e\u0431\u0440\u0430\u0436\u0435\u043d\u0438\u0435 \u0434\u043b\u044f \u0421\u043b\u0438\u043f\u043e\u043d\u044b \"\u041c\u0438\u043d\u0438\"", "fields": ["Image"]}}, {"changed": {"name": "product image", "object": "\u0418\u0437\u043e\u0431\u0440\u0430\u0436\u0435\u043d\u0438\u0435 \u0434\u043b\u044f \u0421\u043b\u0438\u043f\u043e\u043d\u044b \"\u041c\u0438\u043d\u0438\"", "fields": ["Image"]}}]',20,4,'2025-06-07 12:51:10.867612');
INSERT INTO "django_admin_log" VALUES(45,'13','Сапоги "Снежная королева"',2,'[{"changed": {"fields": ["Image"]}}, {"changed": {"name": "product image", "object": "\u0418\u0437\u043e\u0431\u0440\u0430\u0436\u0435\u043d\u0438\u0435 \u0434\u043b\u044f \u0421\u0430\u043f\u043e\u0433\u0438 \"\u0421\u043d\u0435\u0436\u043d\u0430\u044f \u043a\u043e\u0440\u043e\u043b\u0435\u0432\u0430\"", "fields": ["Image"]}}, {"changed": {"name": "product image", "object": "\u0418\u0437\u043e\u0431\u0440\u0430\u0436\u0435\u043d\u0438\u0435 \u0434\u043b\u044f \u0421\u0430\u043f\u043e\u0433\u0438 \"\u0421\u043d\u0435\u0436\u043d\u0430\u044f \u043a\u043e\u0440\u043e\u043b\u0435\u0432\u0430\"", "fields": ["Image"]}}]',20,4,'2025-06-07 12:51:43.698374');
INSERT INTO "django_admin_log" VALUES(46,'12','Эспадрильи "Летний бриз"',2,'[{"changed": {"fields": ["Image"]}}, {"changed": {"name": "product image", "object": "\u0418\u0437\u043e\u0431\u0440\u0430\u0436\u0435\u043d\u0438\u0435 \u0434\u043b\u044f \u042d\u0441\u043f\u0430\u0434\u0440\u0438\u043b\u044c\u0438 \"\u041b\u0435\u0442\u043d\u0438\u0439 \u0431\u0440\u0438\u0437\"", "fields": ["Image"]}}, {"changed": {"name": "product image", "object": "\u0418\u0437\u043e\u0431\u0440\u0430\u0436\u0435\u043d\u0438\u0435 \u0434\u043b\u044f \u042d\u0441\u043f\u0430\u0434\u0440\u0438\u043b\u044c\u0438 \"\u041b\u0435\u0442\u043d\u0438\u0439 \u0431\u0440\u0438\u0437\"", "fields": ["Image"]}}]',20,4,'2025-06-07 12:52:17.086369');
INSERT INTO "django_admin_log" VALUES(47,'11','Ботильоны "Гранд"',2,'[{"changed": {"fields": ["Image"]}}, {"added": {"name": "product image", "object": "\u0418\u0437\u043e\u0431\u0440\u0430\u0436\u0435\u043d\u0438\u0435 \u0434\u043b\u044f \u0411\u043e\u0442\u0438\u043b\u044c\u043e\u043d\u044b \"\u0413\u0440\u0430\u043d\u0434\""}}, {"changed": {"name": "product image", "object": "\u0418\u0437\u043e\u0431\u0440\u0430\u0436\u0435\u043d\u0438\u0435 \u0434\u043b\u044f \u0411\u043e\u0442\u0438\u043b\u044c\u043e\u043d\u044b \"\u0413\u0440\u0430\u043d\u0434\"", "fields": ["Image"]}}, {"changed": {"name": "product image", "object": "\u0418\u0437\u043e\u0431\u0440\u0430\u0436\u0435\u043d\u0438\u0435 \u0434\u043b\u044f \u0411\u043e\u0442\u0438\u043b\u044c\u043e\u043d\u044b \"\u0413\u0440\u0430\u043d\u0434\"", "fields": ["Image"]}}]',20,4,'2025-06-07 12:53:13.524973');
INSERT INTO "django_admin_log" VALUES(48,'10','Сабо "Домашние"',2,'[{"changed": {"fields": ["Image"]}}, {"changed": {"name": "product image", "object": "\u0418\u0437\u043e\u0431\u0440\u0430\u0436\u0435\u043d\u0438\u0435 \u0434\u043b\u044f \u0421\u0430\u0431\u043e \"\u0414\u043e\u043c\u0430\u0448\u043d\u0438\u0435\"", "fields": ["Image"]}}, {"changed": {"name": "product image", "object": "\u0418\u0437\u043e\u0431\u0440\u0430\u0436\u0435\u043d\u0438\u0435 \u0434\u043b\u044f \u0421\u0430\u0431\u043e \"\u0414\u043e\u043c\u0430\u0448\u043d\u0438\u0435\"", "fields": ["Image"]}}]',20,4,'2025-06-07 12:53:51.630901');
INSERT INTO "django_admin_log" VALUES(49,'9','Кеды "Ретро"',2,'[{"changed": {"fields": ["Image"]}}, {"changed": {"name": "product image", "object": "\u0418\u0437\u043e\u0431\u0440\u0430\u0436\u0435\u043d\u0438\u0435 \u0434\u043b\u044f \u041a\u0435\u0434\u044b \"\u0420\u0435\u0442\u0440\u043e\"", "fields": ["Image"]}}, {"changed": {"name": "product image", "object": "\u0418\u0437\u043e\u0431\u0440\u0430\u0436\u0435\u043d\u0438\u0435 \u0434\u043b\u044f \u041a\u0435\u0434\u044b \"\u0420\u0435\u0442\u0440\u043e\"", "fields": ["Image"]}}]',20,4,'2025-06-07 12:54:29.214697');
INSERT INTO "django_admin_log" VALUES(50,'8','Угги "Мягкие"',2,'[{"changed": {"fields": ["Image"]}}, {"changed": {"name": "product image", "object": "\u0418\u0437\u043e\u0431\u0440\u0430\u0436\u0435\u043d\u0438\u0435 \u0434\u043b\u044f \u0423\u0433\u0433\u0438 \"\u041c\u044f\u0433\u043a\u0438\u0435\"", "fields": ["Image"]}}, {"changed": {"name": "product image", "object": "\u0418\u0437\u043e\u0431\u0440\u0430\u0436\u0435\u043d\u0438\u0435 \u0434\u043b\u044f \u0423\u0433\u0433\u0438 \"\u041c\u044f\u0433\u043a\u0438\u0435\"", "fields": ["Image"]}}, {"changed": {"name": "product image", "object": "\u0418\u0437\u043e\u0431\u0440\u0430\u0436\u0435\u043d\u0438\u0435 \u0434\u043b\u044f \u0423\u0433\u0433\u0438 \"\u041c\u044f\u0433\u043a\u0438\u0435\"", "fields": ["Image"]}}]',20,4,'2025-06-07 12:55:12.876577');
INSERT INTO "django_admin_log" VALUES(51,'7','Туфли "Офисный стиль"',2,'[{"changed": {"fields": ["Image"]}}, {"changed": {"name": "product image", "object": "\u0418\u0437\u043e\u0431\u0440\u0430\u0436\u0435\u043d\u0438\u0435 \u0434\u043b\u044f \u0422\u0443\u0444\u043b\u0438 \"\u041e\u0444\u0438\u0441\u043d\u044b\u0439 \u0441\u0442\u0438\u043b\u044c\"", "fields": ["Image"]}}, {"changed": {"name": "product image", "object": "\u0418\u0437\u043e\u0431\u0440\u0430\u0436\u0435\u043d\u0438\u0435 \u0434\u043b\u044f \u0422\u0443\u0444\u043b\u0438 \"\u041e\u0444\u0438\u0441\u043d\u044b\u0439 \u0441\u0442\u0438\u043b\u044c\"", "fields": ["Image"]}}, {"changed": {"name": "product image", "object": "\u0418\u0437\u043e\u0431\u0440\u0430\u0436\u0435\u043d\u0438\u0435 \u0434\u043b\u044f \u0422\u0443\u0444\u043b\u0438 \"\u041e\u0444\u0438\u0441\u043d\u044b\u0439 \u0441\u0442\u0438\u043b\u044c\"", "fields": ["Image"]}}]',20,4,'2025-06-07 12:56:02.308193');
INSERT INTO "django_admin_log" VALUES(52,'6','Сандалии "Лето-2024"',2,'[{"changed": {"fields": ["Image"]}}, {"changed": {"name": "product image", "object": "\u0418\u0437\u043e\u0431\u0440\u0430\u0436\u0435\u043d\u0438\u0435 \u0434\u043b\u044f \u0421\u0430\u043d\u0434\u0430\u043b\u0438\u0438 \"\u041b\u0435\u0442\u043e-2024\"", "fields": ["Image"]}}, {"deleted": {"name": "product image", "object": "\u0418\u0437\u043e\u0431\u0440\u0430\u0436\u0435\u043d\u0438\u0435 \u0434\u043b\u044f \u0421\u0430\u043d\u0434\u0430\u043b\u0438\u0438 \"\u041b\u0435\u0442\u043e-2024\""}}]',20,4,'2025-06-07 12:56:47.038515');
INSERT INTO "django_admin_log" VALUES(53,'5','Ботфорты "Грация"',2,'[{"changed": {"fields": ["Image"]}}, {"changed": {"name": "product image", "object": "\u0418\u0437\u043e\u0431\u0440\u0430\u0436\u0435\u043d\u0438\u0435 \u0434\u043b\u044f \u0411\u043e\u0442\u0444\u043e\u0440\u0442\u044b \"\u0413\u0440\u0430\u0446\u0438\u044f\"", "fields": ["Image"]}}, {"changed": {"name": "product image", "object": "\u0418\u0437\u043e\u0431\u0440\u0430\u0436\u0435\u043d\u0438\u0435 \u0434\u043b\u044f \u0411\u043e\u0442\u0444\u043e\u0440\u0442\u044b \"\u0413\u0440\u0430\u0446\u0438\u044f\"", "fields": ["Image"]}}]',20,4,'2025-06-07 12:57:24.709115');
INSERT INTO "django_admin_log" VALUES(54,'4','Балетки "Комфорт"',2,'[{"changed": {"fields": ["Image"]}}, {"changed": {"name": "product image", "object": "\u0418\u0437\u043e\u0431\u0440\u0430\u0436\u0435\u043d\u0438\u0435 \u0434\u043b\u044f \u0411\u0430\u043b\u0435\u0442\u043a\u0438 \"\u041a\u043e\u043c\u0444\u043e\u0440\u0442\"", "fields": ["Image"]}}, {"changed": {"name": "product image", "object": "\u0418\u0437\u043e\u0431\u0440\u0430\u0436\u0435\u043d\u0438\u0435 \u0434\u043b\u044f \u0411\u0430\u043b\u0435\u0442\u043a\u0438 \"\u041a\u043e\u043c\u0444\u043e\u0440\u0442\"", "fields": ["Image"]}}, {"changed": {"name": "product image", "object": "\u0418\u0437\u043e\u0431\u0440\u0430\u0436\u0435\u043d\u0438\u0435 \u0434\u043b\u044f \u0411\u0430\u043b\u0435\u0442\u043a\u0438 \"\u041a\u043e\u043c\u0444\u043e\u0440\u0442\"", "fields": ["Image"]}}]',20,4,'2025-06-07 12:57:49.791952');
INSERT INTO "django_admin_log" VALUES(55,'3','Зимняя сказка',2,'[{"changed": {"fields": ["Image"]}}, {"changed": {"name": "product image", "object": "\u0418\u0437\u043e\u0431\u0440\u0430\u0436\u0435\u043d\u0438\u0435 \u0434\u043b\u044f \u0417\u0438\u043c\u043d\u044f\u044f \u0441\u043a\u0430\u0437\u043a\u0430", "fields": ["Image"]}}, {"changed": {"name": "product image", "object": "\u0418\u0437\u043e\u0431\u0440\u0430\u0436\u0435\u043d\u0438\u0435 \u0434\u043b\u044f \u0417\u0438\u043c\u043d\u044f\u044f \u0441\u043a\u0430\u0437\u043a\u0430", "fields": ["Image"]}}, {"changed": {"name": "product image", "object": "\u0418\u0437\u043e\u0431\u0440\u0430\u0436\u0435\u043d\u0438\u0435 \u0434\u043b\u044f \u0417\u0438\u043c\u043d\u044f\u044f \u0441\u043a\u0430\u0437\u043a\u0430", "fields": ["Image"]}}]',20,4,'2025-06-07 12:58:22.885601');
INSERT INTO "django_admin_log" VALUES(56,'2','Кроссовки "Спорт-Лайт"',2,'[{"changed": {"fields": ["Image"]}}, {"changed": {"name": "product image", "object": "\u0418\u0437\u043e\u0431\u0440\u0430\u0436\u0435\u043d\u0438\u0435 \u0434\u043b\u044f \u041a\u0440\u043e\u0441\u0441\u043e\u0432\u043a\u0438 \"\u0421\u043f\u043e\u0440\u0442-\u041b\u0430\u0439\u0442\"", "fields": ["Image"]}}]',20,4,'2025-06-07 12:58:46.959325');
INSERT INTO "django_admin_log" VALUES(57,'2','Кроссовки "Спорт-Лайт"',3,'',20,4,'2025-06-07 12:58:59.812096');
INSERT INTO "django_admin_log" VALUES(58,'5','Ботфорты "Грация"',2,'[{"changed": {"fields": ["Image"]}}]',20,4,'2025-06-07 12:59:28.773734');
INSERT INTO "django_admin_log" VALUES(59,'1','Босоножки на каблуке "Элеганс"',3,'',20,4,'2025-06-07 12:59:50.400776');
INSERT INTO "django_admin_log" VALUES(60,'23','Босоножки на каблуке "Элеганс"',3,'',20,4,'2025-06-08 14:46:28.370571');
INSERT INTO "django_admin_log" VALUES(61,'22','Босоножки на каблуке "Элеганс"',3,'',20,4,'2025-06-08 14:46:28.379535');
CREATE TABLE "django_content_type" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "app_label" varchar(100) NOT NULL, "model" varchar(100) NOT NULL);
INSERT INTO "django_content_type" VALUES(1,'admin','logentry');
INSERT INTO "django_content_type" VALUES(2,'auth','permission');
INSERT INTO "django_content_type" VALUES(3,'auth','group');
INSERT INTO "django_content_type" VALUES(4,'contenttypes','contenttype');
INSERT INTO "django_content_type" VALUES(5,'sessions','session');
INSERT INTO "django_content_type" VALUES(6,'social_django','association');
INSERT INTO "django_content_type" VALUES(7,'social_django','code');
INSERT INTO "django_content_type" VALUES(8,'social_django','nonce');
INSERT INTO "django_content_type" VALUES(9,'social_django','usersocialauth');
INSERT INTO "django_content_type" VALUES(10,'social_django','partial');
INSERT INTO "django_content_type" VALUES(11,'users','reward');
INSERT INTO "django_content_type" VALUES(12,'users','user');
INSERT INTO "django_content_type" VALUES(13,'users','userreward');
INSERT INTO "django_content_type" VALUES(14,'orders','cart');
INSERT INTO "django_content_type" VALUES(15,'orders','cartitem');
INSERT INTO "django_content_type" VALUES(16,'orders','order');
INSERT INTO "django_content_type" VALUES(17,'orders','orderitem');
INSERT INTO "django_content_type" VALUES(18,'products','category');
INSERT INTO "django_content_type" VALUES(19,'products','compare');
INSERT INTO "django_content_type" VALUES(20,'products','product');
INSERT INTO "django_content_type" VALUES(21,'products','productimage');
INSERT INTO "django_content_type" VALUES(22,'products','review');
INSERT INTO "django_content_type" VALUES(23,'products','sizeoption');
INSERT INTO "django_content_type" VALUES(24,'products','tag');
INSERT INTO "django_content_type" VALUES(25,'products','wishlist');
INSERT INTO "django_content_type" VALUES(26,'custom_admin','orderstatuslog');
INSERT INTO "django_content_type" VALUES(27,'blog','article');
CREATE TABLE "django_migrations" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "app" varchar(255) NOT NULL, "name" varchar(255) NOT NULL, "applied" datetime NOT NULL);
INSERT INTO "django_migrations" VALUES(1,'contenttypes','0001_initial','2025-06-07 12:16:08.182137');
INSERT INTO "django_migrations" VALUES(2,'contenttypes','0002_remove_content_type_name','2025-06-07 12:16:08.196843');
INSERT INTO "django_migrations" VALUES(3,'auth','0001_initial','2025-06-07 12:16:08.221800');
INSERT INTO "django_migrations" VALUES(4,'auth','0002_alter_permission_name_max_length','2025-06-07 12:16:08.235045');
INSERT INTO "django_migrations" VALUES(5,'auth','0003_alter_user_email_max_length','2025-06-07 12:16:08.245835');
INSERT INTO "django_migrations" VALUES(6,'auth','0004_alter_user_username_opts','2025-06-07 12:16:08.257419');
INSERT INTO "django_migrations" VALUES(7,'auth','0005_alter_user_last_login_null','2025-06-07 12:16:08.268435');
INSERT INTO "django_migrations" VALUES(8,'auth','0006_require_contenttypes_0002','2025-06-07 12:16:08.277073');
INSERT INTO "django_migrations" VALUES(9,'auth','0007_alter_validators_add_error_messages','2025-06-07 12:16:08.288402');
INSERT INTO "django_migrations" VALUES(10,'auth','0008_alter_user_username_max_length','2025-06-07 12:16:08.300257');
INSERT INTO "django_migrations" VALUES(11,'auth','0009_alter_user_last_name_max_length','2025-06-07 12:16:08.316095');
INSERT INTO "django_migrations" VALUES(12,'auth','0010_alter_group_name_max_length','2025-06-07 12:16:08.329446');
INSERT INTO "django_migrations" VALUES(13,'auth','0011_update_proxy_permissions','2025-06-07 12:16:08.340508');
INSERT INTO "django_migrations" VALUES(14,'auth','0012_alter_user_first_name_max_length','2025-06-07 12:16:08.351927');
INSERT INTO "django_migrations" VALUES(15,'users','0001_initial','2025-06-07 12:16:08.381560');
INSERT INTO "django_migrations" VALUES(16,'admin','0001_initial','2025-06-07 12:16:08.405855');
INSERT INTO "django_migrations" VALUES(17,'admin','0002_logentry_remove_auto_add','2025-06-07 12:16:08.423329');
INSERT INTO "django_migrations" VALUES(18,'admin','0003_logentry_add_action_flag_choices','2025-06-07 12:16:08.439651');
INSERT INTO "django_migrations" VALUES(19,'blog','0001_initial','2025-06-07 12:16:08.454558');
INSERT INTO "django_migrations" VALUES(20,'blog','0002_initial','2025-06-07 12:16:08.473081');
INSERT INTO "django_migrations" VALUES(21,'orders','0001_initial','2025-06-07 12:16:08.485578');
INSERT INTO "django_migrations" VALUES(22,'custom_admin','0001_initial','2025-06-07 12:16:08.495879');
INSERT INTO "django_migrations" VALUES(23,'custom_admin','0002_initial','2025-06-07 12:16:08.521550');
INSERT INTO "django_migrations" VALUES(24,'products','0001_initial','2025-06-07 12:16:08.539334');
INSERT INTO "django_migrations" VALUES(25,'orders','0002_initial','2025-06-07 12:16:08.616716');
INSERT INTO "django_migrations" VALUES(26,'products','0002_initial','2025-06-07 12:16:08.788719');
INSERT INTO "django_migrations" VALUES(27,'sessions','0001_initial','2025-06-07 12:16:08.808532');
INSERT INTO "django_migrations" VALUES(28,'default','0001_initial','2025-06-07 12:16:08.858218');
INSERT INTO "django_migrations" VALUES(29,'social_auth','0001_initial','2025-06-07 12:16:08.867614');
INSERT INTO "django_migrations" VALUES(30,'default','0002_add_related_name','2025-06-07 12:16:08.890615');
INSERT INTO "django_migrations" VALUES(31,'social_auth','0002_add_related_name','2025-06-07 12:16:08.891684');
INSERT INTO "django_migrations" VALUES(32,'default','0003_alter_email_max_length','2025-06-07 12:16:08.904463');
INSERT INTO "django_migrations" VALUES(33,'social_auth','0003_alter_email_max_length','2025-06-07 12:16:08.904734');
INSERT INTO "django_migrations" VALUES(34,'default','0004_auto_20160423_0400','2025-06-07 12:16:08.926528');
INSERT INTO "django_migrations" VALUES(35,'social_auth','0004_auto_20160423_0400','2025-06-07 12:16:08.926783');
INSERT INTO "django_migrations" VALUES(36,'social_auth','0005_auto_20160727_2333','2025-06-07 12:16:08.937947');
INSERT INTO "django_migrations" VALUES(37,'social_django','0006_partial','2025-06-07 12:16:08.956295');
INSERT INTO "django_migrations" VALUES(38,'social_django','0007_code_timestamp','2025-06-07 12:16:08.972198');
INSERT INTO "django_migrations" VALUES(39,'social_django','0008_partial_timestamp','2025-06-07 12:16:08.985353');
INSERT INTO "django_migrations" VALUES(40,'social_django','0009_auto_20191118_0520','2025-06-07 12:16:09.022748');
INSERT INTO "django_migrations" VALUES(41,'social_django','0010_uid_db_index','2025-06-07 12:16:09.045382');
INSERT INTO "django_migrations" VALUES(42,'social_django','0011_alter_id_fields','2025-06-07 12:16:09.081014');
INSERT INTO "django_migrations" VALUES(43,'social_django','0012_usersocialauth_extra_data_new','2025-06-07 12:16:09.107071');
INSERT INTO "django_migrations" VALUES(44,'social_django','0013_migrate_extra_data','2025-06-07 12:16:09.134462');
INSERT INTO "django_migrations" VALUES(45,'social_django','0014_remove_usersocialauth_extra_data','2025-06-07 12:16:09.160054');
INSERT INTO "django_migrations" VALUES(46,'social_django','0015_rename_extra_data_new_usersocialauth_extra_data','2025-06-07 12:16:09.186499');
INSERT INTO "django_migrations" VALUES(47,'social_django','0016_alter_usersocialauth_extra_data','2025-06-07 12:16:09.204194');
INSERT INTO "django_migrations" VALUES(48,'social_django','0005_auto_20160727_2333','2025-06-07 12:16:09.214183');
INSERT INTO "django_migrations" VALUES(49,'social_django','0001_initial','2025-06-07 12:16:09.222733');
INSERT INTO "django_migrations" VALUES(50,'social_django','0002_add_related_name','2025-06-07 12:16:09.231206');
INSERT INTO "django_migrations" VALUES(51,'social_django','0003_alter_email_max_length','2025-06-07 12:16:09.239975');
INSERT INTO "django_migrations" VALUES(52,'social_django','0004_auto_20160423_0400','2025-06-07 12:16:09.251477');
CREATE TABLE "django_session" ("session_key" varchar(40) NOT NULL PRIMARY KEY, "session_data" text NOT NULL, "expire_date" datetime NOT NULL);
INSERT INTO "django_session" VALUES('0zf0gbmt8ht1vnt7gyanozcqichc00be','.eJxVjEEOwiAQRe_C2hAoA4JL9z0DGYZBqoYmpV0Z765NutDtf-_9l4i4rTVunZc4ZXERRpx-t4T04LaDfMd2myXNbV2mJHdFHrTLcc78vB7u30HFXr91IZM1FOctAHv0rC1YDWFQzIOxCjwWgsKOtA6o7LkEyImDA5cNGRbvD9ZlN7I:1uN8aU:iVlo1nyzSm5MSngzC39mPgOjvhjHMJCeup7S6SOdQv8','2025-06-19 11:16:46.767000');
INSERT INTO "django_session" VALUES('v10kv6hha0h09dcvkyeprhxdq6riebtj','.eJxVjEEOwiAQRe_C2hDAgYJL956BMDNUqgaS0q6Md7dNutDtf-_9t4hpXUpce57jxOIiQJx-N0z0zHUH_Ej13iS1uswTyl2RB-3y1ji_rof7d1BSL1utB3CDMoxgLRgkQAR_zoHCiGMI3nkk9NqrjIGQFHjLG9DZMLtkkvh8AeAUOHE:1uOHQZ:ks_0tIOanBvMlLhYyEdb_04eWDridpFLjt7TI2xsjTo','2025-06-22 14:55:15.292563');
CREATE TABLE "orders_cart" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "created_at" datetime NOT NULL, "user_id" bigint NOT NULL UNIQUE REFERENCES "users_user" ("id") DEFERRABLE INITIALLY DEFERRED);
INSERT INTO "orders_cart" VALUES(1,'2025-06-05 10:01:15.372000',2);
INSERT INTO "orders_cart" VALUES(2,'2025-06-07 20:55:53.388259',5);
INSERT INTO "orders_cart" VALUES(3,'2025-06-08 04:49:24.448576',4);
CREATE TABLE "orders_cartitem" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "quantity" integer unsigned NOT NULL CHECK ("quantity" >= 0), "size" varchar(10) NOT NULL, "cart_id" bigint NOT NULL REFERENCES "orders_cart" ("id") DEFERRABLE INITIALLY DEFERRED, "product_id" bigint NOT NULL REFERENCES "products_product" ("id") DEFERRABLE INITIALLY DEFERRED);
CREATE TABLE "orders_order" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "first_name" varchar(50) NOT NULL, "last_name" varchar(50) NOT NULL, "email" varchar(254) NOT NULL, "phone" varchar(20) NOT NULL, "address" text NOT NULL, "total_price" decimal NOT NULL, "payment_method" varchar(10) NOT NULL, "delivery_method" varchar(10) NOT NULL, "status" varchar(20) NOT NULL, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL, "user_id" bigint NOT NULL REFERENCES "users_user" ("id") DEFERRABLE INITIALLY DEFERRED);
INSERT INTO "orders_order" VALUES(1,'Елизавета','Засухина','zasuhina.elis2004@gmail.com','+79144447519','Дарасун, 673310, Улица Сосновая Дом 8',2700,'online','courier','pending','2025-06-07 21:04:51.064786','2025-06-07 21:04:51.064805',5);
INSERT INTO "orders_order" VALUES(2,'Елизавета','Засухина','zasuhina.elis2004@gmail.com','+79144447519','Дарасун, 673310, Улица Сосновая Дом 8',5800,'online','courier','pending','2025-06-08 04:50:46.186884','2025-06-08 04:50:46.186915',4);
INSERT INTO "orders_order" VALUES(3,'Елизавета','Засухина','zasuhina.elis2004@gmail.com','+79144447519','Дарасун, 673310, Улица Сосновая Дом 8',5800,'online','courier','processing','2025-06-08 05:38:31.485648','2025-06-08 05:47:58.581150',5);
INSERT INTO "orders_order" VALUES(4,'Елизавета','Засухина','zasuhina.elis2004@gmail.com','+79144447519','Дарасун, 673310, Улица Сосновая Дом 8',11000,'online','courier','completed','2025-06-08 13:27:47.242165','2025-06-08 13:29:01.144313',5);
INSERT INTO "orders_order" VALUES(5,'Елизавета','Засухина','zasuhina.elis2004@gmail.com','+79144447519','Дарасун, 673310, Улица Сосновая Дом 8',5800,'online','courier','processing','2025-06-08 14:54:54.941497','2025-06-08 14:55:54.811472',5);
CREATE TABLE "orders_orderitem" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "quantity" integer unsigned NOT NULL CHECK ("quantity" >= 0), "price" decimal NOT NULL, "size" varchar(10) NULL, "order_id" bigint NOT NULL REFERENCES "orders_order" ("id") DEFERRABLE INITIALLY DEFERRED, "product_id" bigint NOT NULL REFERENCES "products_product" ("id") DEFERRABLE INITIALLY DEFERRED);
INSERT INTO "orders_orderitem" VALUES(1,1,2700,'44',1,20);
INSERT INTO "orders_orderitem" VALUES(2,1,5800,'48',2,21);
INSERT INTO "orders_orderitem" VALUES(3,1,5800,'48',3,21);
INSERT INTO "orders_orderitem" VALUES(4,1,5200,'38',4,11);
INSERT INTO "orders_orderitem" VALUES(5,1,5800,'48',4,21);
INSERT INTO "orders_orderitem" VALUES(6,1,5800,'48',5,21);
CREATE TABLE "products_category" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "name" varchar(100) NOT NULL, "slug" varchar(50) NOT NULL UNIQUE);
INSERT INTO "products_category" VALUES(1,'Женская обувь','zhenskaya-obuv');
INSERT INTO "products_category" VALUES(2,'мужская обувь','muzhskaya-obuv');
CREATE TABLE "products_compare" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "session_key" varchar(40) NULL, "user_id" bigint NULL REFERENCES "users_user" ("id") DEFERRABLE INITIALLY DEFERRED, "product_id" bigint NOT NULL REFERENCES "products_product" ("id") DEFERRABLE INITIALLY DEFERRED);
INSERT INTO "products_compare" VALUES(6,NULL,5,21);
INSERT INTO "products_compare" VALUES(7,NULL,5,20);
CREATE TABLE "products_product" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "name" varchar(255) NOT NULL, "slug" varchar(50) NOT NULL UNIQUE, "price" decimal NOT NULL, "discounted_price" decimal NULL, "is_discounted" bool NOT NULL, "stock" integer unsigned NOT NULL CHECK ("stock" >= 0), "image" varchar(100) NULL, "brand" varchar(255) NULL, "rating" decimal NULL, "seasonal_tag" varchar(50) NULL, "is_recommended" bool NOT NULL, "is_new" bool NOT NULL, "is_seasonal" bool NOT NULL, "is_popular" bool NOT NULL, "created_at" datetime NOT NULL, "is_active" bool NOT NULL, "description" text NOT NULL, "category_id" bigint NOT NULL REFERENCES "products_category" ("id") DEFERRABLE INITIALLY DEFERRED);
INSERT INTO "products_product" VALUES(3,'Зимняя сказка','winter-fairy-boots',6500,5500,1,2,'products/images/зимняя_обувь_3.jpg','zimushka',4,'зима',1,0,0,1,'2025-06-05 10:12:06.312000',1,'Теплые сапоги на меху для холодной зимы.',1);
INSERT INTO "products_product" VALUES(4,'Балетки "Комфорт"','baletki-komfort',2800,NULL,0,10,'products/images/балетки_3.jpg','bal',5,'Лето',1,1,1,0,'2025-06-05 10:13:56.848000',1,'Удобные балетки из мягкой кожи.',1);
INSERT INTO "products_product" VALUES(5,'Ботфорты "Грация"','grace-thigh-boots',7200,NULL,0,2,'products/images/ботфорты_AmmvWTn.jpg','emka',5,'осень',0,0,0,1,'2025-06-05 10:15:27.250000',1,'Высокие сапоги на шпильке.',1);
INSERT INTO "products_product" VALUES(6,'Сандалии "Лето-2024"','summer-2024-sandals',2900,NULL,0,10,'products/images/сандалии_римские1.jpg',NULL,0,'Лето',0,0,1,0,'2025-06-05 10:17:10.774000',1,'Модные сандалии с ремешками.',1);
INSERT INTO "products_product" VALUES(7,'Туфли "Офисный стиль"','office-lady-shoes',3800,NULL,0,5,'products/images/лодочки2.jpg','delovoy_style',5,'Весна',1,0,0,0,'2025-06-05 10:19:48.432000',1,'Классические туфли-лодочки.',1);
INSERT INTO "products_product" VALUES(8,'Угги "Мягкие"','cozy-ugg-boots',5000,4999,1,5,'products/images/угги2.jpg','zimushka',5,'зима',0,0,0,0,'2025-06-05 10:21:35.222000',1,'Теплые угги из овчины.',1);
INSERT INTO "products_product" VALUES(9,'Кеды "Ретро"','retro-canvas-sneakers',2500,NULL,0,10,'products/images/кеды_винт.jpg','bal',5,'Лето',1,1,1,1,'2025-06-05 10:23:00.297000',1,'Стильные кеды в винтажном стиле.',1);
INSERT INTO "products_product" VALUES(10,'Сабо "Домашние"','home-sabots',1500,NULL,0,2,'products/images/сабо_дом.jpg','emka',5,'Весна',1,1,1,0,'2025-06-05 10:24:19.085000',1,'Удобные сабо для дома.',1);
INSERT INTO "products_product" VALUES(11,'Ботильоны "Гранд"','grand-ankle-boots',5200,4999,1,5,'products/images/стиль_бот2.jpg','zimushka',4.5,'осень',1,0,0,1,'2025-06-05 10:26:10.626000',1,'Стильные ботильоны на устойчивом каблуке.',1);
INSERT INTO "products_product" VALUES(12,'Эспадрильи "Летний бриз"','summer-breeze-espadrilles',2100,NULL,0,15,'products/images/эспадрильи1.jpg','emka',5,'Лето',0,0,1,0,'2025-06-05 10:29:37.186000',1,'Легкие эспадрильи на текстильной подошве.',1);
INSERT INTO "products_product" VALUES(13,'Сапоги "Снежная королева"','snow-queen-boots',7800,6900,1,2,'products/images/Снежная_королева1.jpg','zimushka',5,'зима',0,0,0,0,'2025-06-05 10:30:54.825000',1,'Теплые сапоги на меху с высоким голенищем.',1);
INSERT INTO "products_product" VALUES(14,'Слипоны "Мини"','mini-slip-ons',1900,NULL,0,5,'products/images/слиппоны1.jpg','bal',5,'Весна',1,0,1,0,'2025-06-05 10:32:21.971000',1,'Удобные слипоны для повседневной носки.',1);
INSERT INTO "products_product" VALUES(15,'Мюли "Комфорт+"','comfort-mules',4999,NULL,0,2,'products/images/мюли1.jpg','emka',5,'Весна',1,0,1,0,'2025-06-05 10:34:27.461000',1,'Мягкие мюли с открытым носом.',1);
INSERT INTO "products_product" VALUES(16,'Кроссовки "Ультра-Ран"','ultra-run-sneakers',4000,NULL,0,10,'products/images/мужские_кросс_1.jpg','kross_sport',5,'Весна',1,1,0,0,'2025-06-05 10:38:37.682000',1,'Легкие кроссовки для бега.',2);
INSERT INTO "products_product" VALUES(17,'Ботинки "Челленджер"','challenger-boots',6000,NULL,0,2,'products/images/Демисезонные_полуботинки.jpg','emka',5,'осень',0,0,0,0,'2025-06-05 10:42:35.303000',1,'Кожаные ботинки для города.',2);
INSERT INTO "products_product" VALUES(18,'Туфли "Офисные"','men-office-shoes',4500,NULL,0,2,'products/images/кож_бот.jpg','emka',5,'Весна',0,1,0,0,'2025-06-05 10:44:04.691000',1,'Классические мужские туфли.',2);
INSERT INTO "products_product" VALUES(19,'Сандалии "Кемпинг"','camping-sandals',2200,NULL,0,1,'products/images/кемпинг1.jpg','men_shooes',0,'Лето',1,0,1,0,'2025-06-05 10:48:26.626000',1,'Удобные сандалии для отдыха.',2);
INSERT INTO "products_product" VALUES(20,'Кеды "Классик"','classic-canvas-sneakers',2700,NULL,0,2,'products/images/кеды1.jpg','Простые и стильные кеды.',0,'Весна',1,0,0,0,'2025-06-05 10:49:46.045000',1,'Простые и стильные кеды.',2);
INSERT INTO "products_product" VALUES(21,'Сапоги "Зимний драйв"','winter-drive-boots',5800,4999,1,1,'products/images/зим_бот.jpg','zimushka',0,'зима',0,0,0,0,'2025-06-05 10:51:02.141000',1,'Теплые зимние ботинки.',2);
CREATE TABLE "products_product_tags" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "product_id" bigint NOT NULL REFERENCES "products_product" ("id") DEFERRABLE INITIALLY DEFERRED, "tag_id" bigint NOT NULL REFERENCES "products_tag" ("id") DEFERRABLE INITIALLY DEFERRED);
INSERT INTO "products_product_tags" VALUES(3,3,3);
INSERT INTO "products_product_tags" VALUES(4,4,4);
INSERT INTO "products_product_tags" VALUES(5,5,5);
INSERT INTO "products_product_tags" VALUES(6,6,6);
INSERT INTO "products_product_tags" VALUES(7,7,7);
INSERT INTO "products_product_tags" VALUES(8,8,8);
INSERT INTO "products_product_tags" VALUES(9,9,9);
INSERT INTO "products_product_tags" VALUES(10,10,10);
INSERT INTO "products_product_tags" VALUES(11,11,11);
INSERT INTO "products_product_tags" VALUES(12,13,3);
INSERT INTO "products_product_tags" VALUES(13,16,2);
INSERT INTO "products_product_tags" VALUES(14,18,12);
INSERT INTO "products_product_tags" VALUES(15,19,6);
INSERT INTO "products_product_tags" VALUES(16,20,9);
INSERT INTO "products_product_tags" VALUES(17,21,3);
CREATE TABLE "products_productimage" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "image" varchar(100) NOT NULL, "product_id" bigint NOT NULL REFERENCES "products_product" ("id") DEFERRABLE INITIALLY DEFERRED);
INSERT INTO "products_productimage" VALUES(4,'product_images/зимняя_обувь_3.jpg',3);
INSERT INTO "products_productimage" VALUES(5,'product_images/зимняя_обувь_2.jpg',3);
INSERT INTO "products_productimage" VALUES(6,'product_images/зимняя_обувь.jpg',3);
INSERT INTO "products_productimage" VALUES(7,'product_images/балетки_3.jpg',4);
INSERT INTO "products_productimage" VALUES(8,'product_images/балетки_2.jpg',4);
INSERT INTO "products_productimage" VALUES(9,'product_images/балетки_GJ7vowI.jpg',4);
INSERT INTO "products_productimage" VALUES(10,'product_images/ботфорты2_79ptpCJ.jpg',5);
INSERT INTO "products_productimage" VALUES(11,'product_images/ботфорты_MYO79x3.jpg',5);
INSERT INTO "products_productimage" VALUES(12,'product_images/сандалии_римские1.jpg',6);
INSERT INTO "products_productimage" VALUES(14,'product_images/лодочки2_YrjqAL2.jpg',7);
INSERT INTO "products_productimage" VALUES(15,'product_images/лодочки1_EugnAQ4.jpg',7);
INSERT INTO "products_productimage" VALUES(16,'product_images/Лодочки_hmcyiXa.jpg',7);
INSERT INTO "products_productimage" VALUES(17,'product_images/угги1_ATJreni.jpg',8);
INSERT INTO "products_productimage" VALUES(18,'product_images/угги2_nIPpL7k.jpg',8);
INSERT INTO "products_productimage" VALUES(19,'product_images/угги_xbnggNR.jpg',8);
INSERT INTO "products_productimage" VALUES(20,'product_images/кеды_винт2_U8HnwVr.jpg',9);
INSERT INTO "products_productimage" VALUES(21,'product_images/кеды_винт.jpg',9);
INSERT INTO "products_productimage" VALUES(22,'product_images/кеды_винт_Po12Ggv.jpg',9);
INSERT INTO "products_productimage" VALUES(23,'product_images/сабо_дом1_JeRL8eX.jpg',10);
INSERT INTO "products_productimage" VALUES(24,'product_images/сабо_дом1_UExfFp4.jpg',10);
INSERT INTO "products_productimage" VALUES(25,'product_images/стиль_бот2_vQLAqsP.jpg',11);
INSERT INTO "products_productimage" VALUES(26,'product_images/стиль_бот1_d9p9f2P.jpg',11);
INSERT INTO "products_productimage" VALUES(27,'product_images/эспадрильи1_0iZmHwX.jpg',12);
INSERT INTO "products_productimage" VALUES(28,'product_images/эспадрильи_RDvX6X2.jpg',12);
INSERT INTO "products_productimage" VALUES(29,'product_images/Снежная_королева1.jpg',13);
INSERT INTO "products_productimage" VALUES(30,'product_images/Снежная_королева.jpg',13);
INSERT INTO "products_productimage" VALUES(31,'product_images/слиппоны1_yzBlbGb.jpg',14);
INSERT INTO "products_productimage" VALUES(32,'product_images/слиппоны_Vy1fiEL.jpg',14);
INSERT INTO "products_productimage" VALUES(33,'product_images/мюли1_omBlIaN.jpg',15);
INSERT INTO "products_productimage" VALUES(34,'product_images/мюли_XWhRY3Z.jpg',15);
INSERT INTO "products_productimage" VALUES(35,'product_images/мужские_кросс_2.jpg',16);
INSERT INTO "products_productimage" VALUES(36,'product_images/мужские_кросс_1.jpg',16);
INSERT INTO "products_productimage" VALUES(37,'product_images/Демисезонные_полуботинки2.jpg',17);
INSERT INTO "products_productimage" VALUES(38,'product_images/Демисезонные_полуботинки1.jpg',17);
INSERT INTO "products_productimage" VALUES(39,'product_images/Демисезонные_полуботинки.jpg',17);
INSERT INTO "products_productimage" VALUES(40,'product_images/кож_бот_y0Vxyag.jpg',18);
INSERT INTO "products_productimage" VALUES(41,'product_images/кож_бот1_lG8rWvz.jpg',18);
INSERT INTO "products_productimage" VALUES(42,'product_images/кемпинг_kqkGkHt.jpg',19);
INSERT INTO "products_productimage" VALUES(43,'product_images/кемпинг1_LYrOjuF.jpg',19);
INSERT INTO "products_productimage" VALUES(44,'product_images/кеды.jpg',20);
INSERT INTO "products_productimage" VALUES(45,'product_images/кеды1_QXeLabO.jpg',20);
INSERT INTO "products_productimage" VALUES(46,'product_images/зим_бот_zCVx4Ng.jpg',21);
INSERT INTO "products_productimage" VALUES(47,'product_images/зим_бот1_2M2ucDX.jpg',21);
INSERT INTO "products_productimage" VALUES(48,'product_images/стиль_бот_J5XoDRU.jpg',11);
CREATE TABLE "products_review" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "rating" integer unsigned NOT NULL CHECK ("rating" >= 0), "comment" text NOT NULL, "created_at" datetime NOT NULL, "product_id" bigint NOT NULL REFERENCES "products_product" ("id") DEFERRABLE INITIALLY DEFERRED, "user_id" bigint NOT NULL REFERENCES "users_user" ("id") DEFERRABLE INITIALLY DEFERRED);
INSERT INTO "products_review" VALUES(1,5,'Отличные сапоги)','2025-06-08 05:06:28.131945',21,4);
CREATE TABLE "products_sizeoption" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "size" varchar(10) NOT NULL, "in_stock" bool NOT NULL, "stock_quantity" integer unsigned NOT NULL CHECK ("stock_quantity" >= 0), "product_id" bigint NOT NULL REFERENCES "products_product" ("id") DEFERRABLE INITIALLY DEFERRED);
INSERT INTO "products_sizeoption" VALUES(8,'37',1,2,3);
INSERT INTO "products_sizeoption" VALUES(9,'36',1,2,4);
INSERT INTO "products_sizeoption" VALUES(10,'37',1,2,4);
INSERT INTO "products_sizeoption" VALUES(11,'38',1,6,4);
INSERT INTO "products_sizeoption" VALUES(12,'38',1,1,5);
INSERT INTO "products_sizeoption" VALUES(13,'39',1,1,5);
INSERT INTO "products_sizeoption" VALUES(14,'36',1,5,6);
INSERT INTO "products_sizeoption" VALUES(15,'37',1,2,6);
INSERT INTO "products_sizeoption" VALUES(16,'38',1,2,6);
INSERT INTO "products_sizeoption" VALUES(17,'39',1,1,6);
INSERT INTO "products_sizeoption" VALUES(18,'36',1,2,7);
INSERT INTO "products_sizeoption" VALUES(19,'37',1,3,7);
INSERT INTO "products_sizeoption" VALUES(20,'37',1,1,8);
INSERT INTO "products_sizeoption" VALUES(21,'38',1,2,8);
INSERT INTO "products_sizeoption" VALUES(22,'39',1,2,8);
INSERT INTO "products_sizeoption" VALUES(23,'37',1,5,9);
INSERT INTO "products_sizeoption" VALUES(24,'39',1,5,9);
INSERT INTO "products_sizeoption" VALUES(25,'38',1,1,10);
INSERT INTO "products_sizeoption" VALUES(26,'39',1,1,10);
INSERT INTO "products_sizeoption" VALUES(27,'38',1,2,11);
INSERT INTO "products_sizeoption" VALUES(28,'39',1,3,11);
INSERT INTO "products_sizeoption" VALUES(29,'36',1,2,12);
INSERT INTO "products_sizeoption" VALUES(30,'37',1,2,12);
INSERT INTO "products_sizeoption" VALUES(31,'38',1,2,12);
INSERT INTO "products_sizeoption" VALUES(32,'39',1,2,12);
INSERT INTO "products_sizeoption" VALUES(33,'40',1,2,12);
INSERT INTO "products_sizeoption" VALUES(34,'37',1,1,13);
INSERT INTO "products_sizeoption" VALUES(35,'38',1,2,13);
INSERT INTO "products_sizeoption" VALUES(36,'39',1,2,14);
INSERT INTO "products_sizeoption" VALUES(37,'37',1,2,14);
INSERT INTO "products_sizeoption" VALUES(38,'34',1,1,14);
INSERT INTO "products_sizeoption" VALUES(39,'37',1,2,15);
INSERT INTO "products_sizeoption" VALUES(40,'44',1,2,16);
INSERT INTO "products_sizeoption" VALUES(41,'42',1,2,16);
INSERT INTO "products_sizeoption" VALUES(42,'39',1,2,16);
INSERT INTO "products_sizeoption" VALUES(43,'46',1,2,16);
INSERT INTO "products_sizeoption" VALUES(44,'38',1,2,16);
INSERT INTO "products_sizeoption" VALUES(45,'46',1,1,17);
INSERT INTO "products_sizeoption" VALUES(46,'48',1,2,17);
INSERT INTO "products_sizeoption" VALUES(47,'44',1,1,18);
INSERT INTO "products_sizeoption" VALUES(48,'46',1,1,18);
INSERT INTO "products_sizeoption" VALUES(49,'44',1,1,19);
INSERT INTO "products_sizeoption" VALUES(50,'44',1,1,20);
INSERT INTO "products_sizeoption" VALUES(51,'46',1,1,20);
INSERT INTO "products_sizeoption" VALUES(52,'48',1,1,21);
CREATE TABLE "products_tag" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "name" varchar(50) NOT NULL UNIQUE, "slug" varchar(50) NOT NULL UNIQUE);
INSERT INTO "products_tag" VALUES(1,'Босоножки','bosonozhki');
INSERT INTO "products_tag" VALUES(2,'Кроссовки','krossovki');
INSERT INTO "products_tag" VALUES(3,'зимняя обувь','zimnyaya-obuv');
INSERT INTO "products_tag" VALUES(4,'балетки','baletki');
INSERT INTO "products_tag" VALUES(5,'ботфорты','botforty');
INSERT INTO "products_tag" VALUES(6,'сандалии','sandalii');
INSERT INTO "products_tag" VALUES(7,'лодочки','lodochki');
INSERT INTO "products_tag" VALUES(8,'угги','uggi');
INSERT INTO "products_tag" VALUES(9,'кеды','kedy');
INSERT INTO "products_tag" VALUES(10,'сабо','sabo');
INSERT INTO "products_tag" VALUES(11,'ботильоны','botilony');
INSERT INTO "products_tag" VALUES(12,'офис','ofis');
CREATE TABLE "products_wishlist" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "added_at" datetime NOT NULL, "product_id" bigint NOT NULL REFERENCES "products_product" ("id") DEFERRABLE INITIALLY DEFERRED, "user_id" bigint NOT NULL REFERENCES "users_user" ("id") DEFERRABLE INITIALLY DEFERRED);
INSERT INTO "products_wishlist" VALUES(1,'2025-06-07 13:00:04.747728',21,4);
INSERT INTO "products_wishlist" VALUES(5,'2025-06-08 13:34:03.606030',20,5);
INSERT INTO "products_wishlist" VALUES(6,'2025-06-08 14:51:14.236334',21,5);
CREATE TABLE "social_auth_association" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "server_url" varchar(255) NOT NULL, "handle" varchar(255) NOT NULL, "secret" varchar(255) NOT NULL, "issued" integer NOT NULL, "lifetime" integer NOT NULL, "assoc_type" varchar(64) NOT NULL);
CREATE TABLE "social_auth_code" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "email" varchar(254) NOT NULL, "code" varchar(32) NOT NULL, "verified" bool NOT NULL, "timestamp" datetime NOT NULL);
CREATE TABLE "social_auth_nonce" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "server_url" varchar(255) NOT NULL, "timestamp" integer NOT NULL, "salt" varchar(65) NOT NULL);
CREATE TABLE "social_auth_partial" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "token" varchar(32) NOT NULL, "next_step" smallint unsigned NOT NULL CHECK ("next_step" >= 0), "backend" varchar(32) NOT NULL, "timestamp" datetime NOT NULL, "data" text NOT NULL CHECK ((JSON_VALID("data") OR "data" IS NULL)));
CREATE TABLE "social_auth_usersocialauth" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "provider" varchar(32) NOT NULL, "uid" varchar(255) NOT NULL, "user_id" bigint NOT NULL REFERENCES "users_user" ("id") DEFERRABLE INITIALLY DEFERRED, "created" datetime NOT NULL, "modified" datetime NOT NULL, "extra_data" text NOT NULL CHECK ((JSON_VALID("extra_data") OR "extra_data" IS NULL)));
CREATE TABLE "users_reward" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "name" varchar(255) NOT NULL UNIQUE, "description" text NOT NULL, "threshold" integer NOT NULL, "type" varchar(50) NOT NULL);
CREATE TABLE "users_user" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "password" varchar(128) NOT NULL, "last_login" datetime NULL, "is_superuser" bool NOT NULL, "username" varchar(150) NOT NULL UNIQUE, "first_name" varchar(150) NOT NULL, "last_name" varchar(150) NOT NULL, "email" varchar(254) NOT NULL, "is_staff" bool NOT NULL, "is_active" bool NOT NULL, "date_joined" datetime NOT NULL, "role" varchar(20) NOT NULL, "phone" varchar(20) NULL, "address" text NULL, "birth_date" date NULL, "avatar" varchar(100) NULL, "secret_code" varchar(100) NULL, "is_admin" bool NOT NULL);
INSERT INTO "users_user" VALUES(1,'pbkdf2_sha256$1000000$1J7Vl3Q71qpHzl8LC6Kawt$HD6RkCEsIwTFg3LKaKPj/D2oyrin0GQ5Y91b4SzlN1w=','2025-06-05 09:52:05.976000',0,'liza','Елизавета','Засухина','Zasukhina.2021@mail.ru',0,1,'2025-06-05 09:52:04.841000','user','9242736318',NULL,'2025-06-02','avatars/Fotoram.io.png',NULL,0);
INSERT INTO "users_user" VALUES(2,'pbkdf2_sha256$1000000$lP0tdhLpEVroqFUdsaP16n$ksrziCbaAjtf56pJf/FnciVZFarKZ9j5nThbLRgbEo0=','2025-06-05 09:53:08.008000',1,'admin1','','','',1,1,'2025-06-05 09:52:44.609000','user',NULL,NULL,NULL,'',NULL,0);
INSERT INTO "users_user" VALUES(3,'pbkdf2_sha256$1000000$KZdUqZiFiVRUwbUj6Hi4c3$9PcQM33f0OXwF3lzWRhYDte1kcKeTbCtdKxbZvWKJ8Y=','2025-06-05 11:16:46.758000',1,'merlissa','','','',1,1,'2025-06-05 11:16:16.082000','user',NULL,NULL,NULL,'',NULL,0);
INSERT INTO "users_user" VALUES(4,'pbkdf2_sha256$720000$lCIIUnSIoq6kE5bIq1w7GS$OP12H9PbFOE4MmWyoo0bye5/NS1WvCCD++YMUNMIO5E=','2025-06-08 14:55:15.282479',1,'admin','','','',1,1,'2025-06-07 12:30:59.369839','user',NULL,NULL,NULL,'',NULL,0);
INSERT INTO "users_user" VALUES(5,'pbkdf2_sha256$720000$wSy9FT3OXXKcvO8BkbO9Er$LT+1D7PghpWRrG7GgPZ9CtoR9CHiWRBKFKiiucpD0A8=','2025-06-08 14:50:11.982478',0,'z16.elissa','Алена','Засухина','zasuhina.elis2004@gmail.com',0,1,'2025-06-07 20:55:43.762478','user',NULL,'',NULL,'avatars/1026362715.jpg',NULL,0);
CREATE TABLE "users_user_groups" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "user_id" bigint NOT NULL REFERENCES "users_user" ("id") DEFERRABLE INITIALLY DEFERRED, "group_id" integer NOT NULL REFERENCES "auth_group" ("id") DEFERRABLE INITIALLY DEFERRED);
CREATE TABLE "users_user_user_permissions" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "user_id" bigint NOT NULL REFERENCES "users_user" ("id") DEFERRABLE INITIALLY DEFERRED, "permission_id" integer NOT NULL REFERENCES "auth_permission" ("id") DEFERRABLE INITIALLY DEFERRED);
CREATE TABLE "users_userreward" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "date_earned" datetime NOT NULL, "reward_id" bigint NOT NULL REFERENCES "users_reward" ("id") DEFERRABLE INITIALLY DEFERRED, "user_id" bigint NOT NULL REFERENCES "users_user" ("id") DEFERRABLE INITIALLY DEFERRED);
CREATE UNIQUE INDEX "django_content_type_app_label_model_76bd3d3b_uniq" ON "django_content_type" ("app_label", "model");
CREATE UNIQUE INDEX "auth_group_permissions_group_id_permission_id_0cd325b0_uniq" ON "auth_group_permissions" ("group_id", "permission_id");
CREATE INDEX "auth_group_permissions_group_id_b120cbf9" ON "auth_group_permissions" ("group_id");
CREATE INDEX "auth_group_permissions_permission_id_84c5c92e" ON "auth_group_permissions" ("permission_id");
CREATE UNIQUE INDEX "auth_permission_content_type_id_codename_01ab375a_uniq" ON "auth_permission" ("content_type_id", "codename");
CREATE INDEX "auth_permission_content_type_id_2f476e4b" ON "auth_permission" ("content_type_id");
CREATE UNIQUE INDEX "users_user_groups_user_id_group_id_b88eab82_uniq" ON "users_user_groups" ("user_id", "group_id");
CREATE INDEX "users_user_groups_user_id_5f6f5a90" ON "users_user_groups" ("user_id");
CREATE INDEX "users_user_groups_group_id_9afc8d0e" ON "users_user_groups" ("group_id");
CREATE UNIQUE INDEX "users_user_user_permissions_user_id_permission_id_43338c45_uniq" ON "users_user_user_permissions" ("user_id", "permission_id");
CREATE INDEX "users_user_user_permissions_user_id_20aca447" ON "users_user_user_permissions" ("user_id");
CREATE INDEX "users_user_user_permissions_permission_id_0b93982e" ON "users_user_user_permissions" ("permission_id");
CREATE UNIQUE INDEX "users_userreward_user_id_reward_id_b30c9558_uniq" ON "users_userreward" ("user_id", "reward_id");
CREATE INDEX "users_userreward_reward_id_94091525" ON "users_userreward" ("reward_id");
CREATE INDEX "users_userreward_user_id_76942aad" ON "users_userreward" ("user_id");
CREATE INDEX "django_admin_log_content_type_id_c4bce8eb" ON "django_admin_log" ("content_type_id");
CREATE INDEX "django_admin_log_user_id_c564eba6" ON "django_admin_log" ("user_id");
CREATE INDEX "blog_article_author_id_905add38" ON "blog_article" ("author_id");
CREATE INDEX "custom_admin_orderstatuslog_changed_by_id_bdf0e497" ON "custom_admin_orderstatuslog" ("changed_by_id");
CREATE INDEX "custom_admin_orderstatuslog_order_id_94aa6663" ON "custom_admin_orderstatuslog" ("order_id");
CREATE INDEX "orders_cartitem_cart_id_529df5fa" ON "orders_cartitem" ("cart_id");
CREATE INDEX "orders_cartitem_product_id_55063ee7" ON "orders_cartitem" ("product_id");
CREATE INDEX "orders_order_user_id_e9b59eb1" ON "orders_order" ("user_id");
CREATE INDEX "orders_orderitem_order_id_fe61a34d" ON "orders_orderitem" ("order_id");
CREATE INDEX "orders_orderitem_product_id_afe4254a" ON "orders_orderitem" ("product_id");
CREATE INDEX "products_product_category_id_9b594869" ON "products_product" ("category_id");
CREATE INDEX "products_compare_user_id_4c3c0de6" ON "products_compare" ("user_id");
CREATE INDEX "products_compare_product_id_526cea9e" ON "products_compare" ("product_id");
CREATE INDEX "products_productimage_product_id_e747596a" ON "products_productimage" ("product_id");
CREATE INDEX "products_review_product_id_d933ffa7" ON "products_review" ("product_id");
CREATE INDEX "products_review_user_id_2e53b831" ON "products_review" ("user_id");
CREATE INDEX "products_sizeoption_product_id_000eee5f" ON "products_sizeoption" ("product_id");
CREATE UNIQUE INDEX "products_product_tags_product_id_tag_id_a36d84e8_uniq" ON "products_product_tags" ("product_id", "tag_id");
CREATE INDEX "products_product_tags_product_id_f82cb4be" ON "products_product_tags" ("product_id");
CREATE INDEX "products_product_tags_tag_id_f2d7d0b4" ON "products_product_tags" ("tag_id");
CREATE INDEX "products_wishlist_product_id_7c798228" ON "products_wishlist" ("product_id");
CREATE INDEX "products_wishlist_user_id_eea5692f" ON "products_wishlist" ("user_id");
CREATE UNIQUE INDEX "products_compare_session_key_product_id_840e71bd_uniq" ON "products_compare" ("session_key", "product_id");
CREATE UNIQUE INDEX "products_compare_user_id_product_id_b948bf2d_uniq" ON "products_compare" ("user_id", "product_id");
CREATE UNIQUE INDEX "products_sizeoption_product_id_size_b6eb4770_uniq" ON "products_sizeoption" ("product_id", "size");
CREATE UNIQUE INDEX "products_wishlist_user_id_product_id_dcf61f93_uniq" ON "products_wishlist" ("user_id", "product_id");
CREATE INDEX "django_session_expire_date_a5c62663" ON "django_session" ("expire_date");
CREATE UNIQUE INDEX "social_auth_association_server_url_handle_078befa2_uniq" ON "social_auth_association" ("server_url", "handle");
CREATE UNIQUE INDEX "social_auth_code_email_code_801b2d02_uniq" ON "social_auth_code" ("email", "code");
CREATE INDEX "social_auth_code_code_a2393167" ON "social_auth_code" ("code");
CREATE INDEX "social_auth_code_timestamp_176b341f" ON "social_auth_code" ("timestamp");
CREATE UNIQUE INDEX "social_auth_nonce_server_url_timestamp_salt_f6284463_uniq" ON "social_auth_nonce" ("server_url", "timestamp", "salt");
CREATE UNIQUE INDEX "social_auth_usersocialauth_provider_uid_e6b5e668_uniq" ON "social_auth_usersocialauth" ("provider", "uid");
CREATE INDEX "social_auth_usersocialauth_uid_796e51dc" ON "social_auth_usersocialauth" ("uid");
CREATE INDEX "social_auth_usersocialauth_user_id_17d28448" ON "social_auth_usersocialauth" ("user_id");
CREATE INDEX "social_auth_partial_token_3017fea3" ON "social_auth_partial" ("token");
CREATE INDEX "social_auth_partial_timestamp_50f2119f" ON "social_auth_partial" ("timestamp");
DELETE FROM "sqlite_sequence";
INSERT INTO "sqlite_sequence" VALUES('django_migrations',52);
INSERT INTO "sqlite_sequence" VALUES('django_content_type',27);
INSERT INTO "sqlite_sequence" VALUES('auth_permission',110);
INSERT INTO "sqlite_sequence" VALUES('auth_group',0);
INSERT INTO "sqlite_sequence" VALUES('django_admin_log',61);
INSERT INTO "sqlite_sequence" VALUES('blog_article',3);
INSERT INTO "sqlite_sequence" VALUES('custom_admin_orderstatuslog',0);
INSERT INTO "sqlite_sequence" VALUES('orders_cart',3);
INSERT INTO "sqlite_sequence" VALUES('orders_cartitem',8);
INSERT INTO "sqlite_sequence" VALUES('orders_order',5);
INSERT INTO "sqlite_sequence" VALUES('orders_orderitem',6);
INSERT INTO "sqlite_sequence" VALUES('products_product',23);
INSERT INTO "sqlite_sequence" VALUES('products_compare',7);
INSERT INTO "sqlite_sequence" VALUES('products_productimage',48);
INSERT INTO "sqlite_sequence" VALUES('products_review',2);
INSERT INTO "sqlite_sequence" VALUES('products_sizeoption',56);
INSERT INTO "sqlite_sequence" VALUES('products_wishlist',6);
INSERT INTO "sqlite_sequence" VALUES('social_auth_association',0);
INSERT INTO "sqlite_sequence" VALUES('social_auth_code',0);
INSERT INTO "sqlite_sequence" VALUES('social_auth_nonce',0);
INSERT INTO "sqlite_sequence" VALUES('social_auth_usersocialauth',0);
INSERT INTO "sqlite_sequence" VALUES('social_auth_partial',0);
INSERT INTO "sqlite_sequence" VALUES('users_user',5);
INSERT INTO "sqlite_sequence" VALUES('products_category',2);
INSERT INTO "sqlite_sequence" VALUES('products_tag',12);
INSERT INTO "sqlite_sequence" VALUES('products_product_tags',19);
COMMIT;
