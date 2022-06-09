# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    wp-config.php                                      :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: mlazzare <mlazzare@student.s19.be>         +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/06/06 14:33:20 by mlazzare          #+#    #+#              #
#    Updated: 2022/06/09 07:16:41 by mlazzare         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

<?php

// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', getenv('MYSQL_DB') );

/** MySQL database username */
define( 'DB_USER', getenv('MYSQL_USER') );

/** MySQL database password */
define( 'DB_PASSWORD', getenv('MYSQL_PASSWORD') );

/** MySQL hostname */
define( 'DB_HOST', getenv('MYSQL_HOST') );

/** Database Charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8' );

/** The Database Collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

/**#@+
 * Authentication Unique Keys and Salts.
 *
 * Change these to different unique phrases!
 * You can generate these using the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}
 * You can change these at any point in time to invalidate all existing cookies. This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define('AUTH_KEY',         '^HDOr`[O;us4v<&5PnP~u9qadZcnF)kS2=>AU:ecWa<3boyy`[gSw+%-+^9-^u+d');
define('SECURE_AUTH_KEY',  '#1uh5fe`,~!sw++|nY0xf}/ O}]| tvMTHc}oN$ABN|v/|v5<boSF.K1>D`Vmn=[');
define('LOGGED_IN_KEY',    'qUb&> sG|8NUjJ!/|$)Dq!OpS`R)r-vUi5&]1]Rr/(ncplO:S]eOIs}TWGu8Xk:1');
define('NONCE_KEY',        '^qqq<9{gMuUl#U.Duh5gG1F5ZsmhN+$oeso~`|=C6]OoWq?nNvcC<Im1UxbW)iIY');
define('AUTH_SALT',        '6S!>B+8&/cxo&5FJc9NU$%<wN2im?t~)LR(+/!yk)qp:mG&q+:6XG&1$n|!w+e7+');
define('SECURE_AUTH_SALT', 'uFdm#y,ud&s]@vw(7W`Z^TM63*9sWQz+#yldb 6n@+VHcD0n-mz8){|J)xdOzwDO');
define('LOGGED_IN_SALT',   '.&6D!Ycx_mBeQ3v:/wJ&*FDdXcf,|,P(/i>O[nj<T}gy%m8*gZNnsVbL`0!KbEuW');
define('NONCE_SALT',       'Gf,>LmLzORhlPe9pG=y}N4;Z:Vx|Xgd)-7,JA2/KezHq7duF(}X(*IB|Uq=}d;7x');

/**#@-*/

/**
 * WordPress Database Table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the Codex.
 *
 * @link https://codex.wordpress.org/Debugging_in_WordPress
 */
define( 'WP_DEBUG', false );

/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', dirname( __FILE__ ) . '/' );
}

/** Sets up WordPress vars and included files. */
require_once( ABSPATH . 'wp-settings.php' );