# = Class: sysklogd
#
# This is the main sysklogd class
#
#
# == Parameters
#
# Standard class parameters
# Define the general class behaviour and customizations
#
# [*my_class*]
#   Name of a custom class to autoload to manage module's customizations
#   If defined, sysklogd class will automatically "include $my_class"
#   Can be defined also by the (top scope) variable $sysklogd_myclass
#
# [*source*]
#   Sets the content of source parameter for main configuration file
#   If defined, sysklogd main config file will have the param: source => $source
#   Can be defined also by the (top scope) variable $sysklogd_source
#
# [*source_dir*]
#   If defined, the whole sysklogd configuration directory content is retrieved
#   recursively from the specified source
#   (source => $source_dir , recurse => true)
#   Can be defined also by the (top scope) variable $sysklogd_source_dir
#
# [*source_dir_purge*]
#   If set to true (default false) the existing configuration directory is
#   mirrored with the content retrieved from source_dir
#   (source => $source_dir , recurse => true , purge => true)
#   Can be defined also by the (top scope) variable $sysklogd_source_dir_purge
#
# [*template*]
#   Sets the path to the template to use as content for main configuration file
#   If defined, sysklogd main config file has: content => content("$template")
#   Note source and template parameters are mutually exclusive: don't use both
#   Can be defined also by the (top scope) variable $sysklogd_template
#
# [*options*]
#   An hash of custom options to be used in templates for arbitrary settings.
#   Can be defined also by the (top scope) variable $sysklogd_options
#
# [*service_autorestart*]
#   Automatically restarts the sysklogd service when there is a change in
#   configuration files. Default: true, Set to false if you don't want to
#   automatically restart the service.
#
# [*version*]
#   The package version, used in the ensure parameter of package type.
#   Default: present. Can be 'latest' or a specific version number.
#   Note that if the argument absent (see below) is set to true, the
#   package is removed, whatever the value of version parameter.
#
# [*absent*]
#   Set to 'true' to remove package(s) installed by module
#   Can be defined also by the (top scope) variable $sysklogd_absent
#
# [*disable*]
#   Set to 'true' to disable service(s) managed by module
#   Can be defined also by the (top scope) variable $sysklogd_disable
#
# [*disableboot*]
#   Set to 'true' to disable service(s) at boot, without checks if it's running
#   Use this when the service is managed by a tool like a cluster software
#   Can be defined also by the (top scope) variable $sysklogd_disableboot
#
# [*monitor*]
#   Set to 'true' to enable monitoring of the services provided by the module
#   Can be defined also by the (top scope) variables $sysklogd_monitor
#   and $monitor
#
# [*monitor_tool*]
#   Define which monitor tools (ad defined in Example42 monitor module)
#   you want to use for sysklogd checks
#   Can be defined also by the (top scope) variables $sysklogd_monitor_tool
#   and $monitor_tool
#
# [*monitor_target*]
#   The Ip address or hostname to use as a target for monitoring tools.
#   Default is the fact $ipaddress
#   Can be defined also by the (top scope) variables $sysklogd_monitor_target
#   and $monitor_target
#
# [*puppi*]
#   Set to 'true' to enable creation of module data files that are used by puppi
#   Can be defined also by the (top scope) variables $sysklogd_puppi and $puppi
#
# [*puppi_helper*]
#   Specify the helper to use for puppi commands. The default for this module
#   is specified in params.pp and is generally a good choice.
#   You can customize the output of puppi commands for this module using another
#   puppi helper. Use the define puppi::helper to create a new custom helper
#   Can be defined also by the (top scope) variables $sysklogd_puppi_helper
#   and $puppi_helper
#
# [*firewall*]
#   Set to 'true' to enable firewalling of the services provided by the module
#   Can be defined also by the (top scope) variables $sysklogd_firewall
#   and $firewall
#
# [*firewall_tool*]
#   Define which firewall tool(s) (ad defined in Example42 firewall module)
#   you want to use to open firewall for sysklogd port(s)
#   Can be defined also by the (top scope) variables $sysklogd_firewall_tool
#   and $firewall_tool
#
# [*firewall_src*]
#   Define which source ip/net allow for firewalling sysklogd. Default: 0.0.0.0/0
#   Can be defined also by the (top scope) variables $sysklogd_firewall_src
#   and $firewall_src
#
# [*firewall_dst*]
#   Define which destination ip to use for firewalling. Default: $ipaddress
#   Can be defined also by the (top scope) variables $sysklogd_firewall_dst
#   and $firewall_dst
#
# [*debug*]
#   Set to 'true' to enable modules debugging
#   Can be defined also by the (top scope) variables $sysklogd_debug and $debug
#
# [*audit_only*]
#   Set to 'true' if you don't intend to override existing configuration files
#   and want to audit the difference between existing files and the ones
#   managed by Puppet.
#   Can be defined also by the (top scope) variables $sysklogd_audit_only
#   and $audit_only
#
# [*noops*]
#   Set noop metaparameter to true for all the resources managed by the module.
#   Basically you can run a dryrun for this specific module if you set
#   this to true. Default: false
#
# Default class params - As defined in sysklogd::params.
# Note that these variables are mostly defined and used in the module itself,
# overriding the default values might not affected all the involved components.
# Set and override them only if you know what you're doing.
# Note also that you can't override/set them via top scope variables.
#
# [*package*]
#   The name of sysklogd package
#
# [*service*]
#   The name of sysklogd service
#
# [*service_status*]
#   If the sysklogd service init script supports status argument
#
# [*process*]
#   The name of sysklogd process
#
# [*process_args*]
#   The name of sysklogd arguments. Used by puppi and monitor.
#   Used only in case the sysklogd process name is generic (java, ruby...)
#
# [*process_user*]
#   The name of the user sysklogd runs with. Used by puppi and monitor.
#
# [*config_dir*]
#   Main configuration directory. Used by puppi
#
# [*config_file*]
#   Main configuration file path
#
# [*config_file_mode*]
#   Main configuration file path mode
#
# [*config_file_owner*]
#   Main configuration file path owner
#
# [*config_file_group*]
#   Main configuration file path group
#
# [*config_file_init*]
#   Path of configuration file sourced by init script
#
# [*pid_file*]
#   Path of pid file. Used by monitor
#
# [*data_dir*]
#   Path of application data directory. Used by puppi
#
# [*log_dir*]
#   Base logs directory. Used by puppi
#
# [*log_file*]
#   Log file(s). Used by puppi
#
# [*port*]
#   The listening port, if any, of the service.
#   This is used by monitor, firewall and puppi (optional) components
#   Note: This doesn't necessarily affect the service configuration file
#   Can be defined also by the (top scope) variable $sysklogd_port
#
# [*protocol*]
#   The protocol used by the the service.
#   This is used by monitor, firewall and puppi (optional) components
#   Can be defined also by the (top scope) variable $sysklogd_protocol
#
#
# See README for usage patterns.
#
class sysklogd (
  $my_class            = params_lookup( 'my_class' ),
  $source              = params_lookup( 'source' ),
  $source_dir          = params_lookup( 'source_dir' ),
  $source_dir_purge    = params_lookup( 'source_dir_purge' ),
  $template            = params_lookup( 'template' ),
  $service_autorestart = params_lookup( 'service_autorestart' , 'global' ),
  $options             = params_lookup( 'options' ),
  $version             = params_lookup( 'version' ),
  $absent              = params_lookup( 'absent' ),
  $disable             = params_lookup( 'disable' ),
  $disableboot         = params_lookup( 'disableboot' ),
  $monitor             = params_lookup( 'monitor' , 'global' ),
  $monitor_tool        = params_lookup( 'monitor_tool' , 'global' ),
  $monitor_target      = params_lookup( 'monitor_target' , 'global' ),
  $puppi               = params_lookup( 'puppi' , 'global' ),
  $puppi_helper        = params_lookup( 'puppi_helper' , 'global' ),
  $firewall            = params_lookup( 'firewall' , 'global' ),
  $firewall_tool       = params_lookup( 'firewall_tool' , 'global' ),
  $firewall_src        = params_lookup( 'firewall_src' , 'global' ),
  $firewall_dst        = params_lookup( 'firewall_dst' , 'global' ),
  $debug               = params_lookup( 'debug' , 'global' ),
  $audit_only          = params_lookup( 'audit_only' , 'global' ),
  $noops               = params_lookup( 'noops' ),
  $package             = params_lookup( 'package' ),
  $service             = params_lookup( 'service' ),
  $service_status      = params_lookup( 'service_status' ),
  $process             = params_lookup( 'process' ),
  $process_args        = params_lookup( 'process_args' ),
  $process_user        = params_lookup( 'process_user' ),
  $config_dir          = params_lookup( 'config_dir' ),
  $config_file         = params_lookup( 'config_file' ),
  $config_file_mode    = params_lookup( 'config_file_mode' ),
  $config_file_owner   = params_lookup( 'config_file_owner' ),
  $config_file_group   = params_lookup( 'config_file_group' ),
  $config_file_init    = params_lookup( 'config_file_init' ),
  $pid_file            = params_lookup( 'pid_file' ),
  $data_dir            = params_lookup( 'data_dir' ),
  $log_dir             = params_lookup( 'log_dir' ),
  $log_file            = params_lookup( 'log_file' ),
  $port                = params_lookup( 'port' ),
  $protocol            = params_lookup( 'protocol' )
  ) inherits sysklogd::params {

  $bool_source_dir_purge=any2bool($source_dir_purge)
  $bool_service_autorestart=any2bool($service_autorestart)
  $bool_absent=any2bool($absent)
  $bool_disable=any2bool($disable)
  $bool_disableboot=any2bool($disableboot)
  $bool_monitor=any2bool($monitor)
  $bool_puppi=any2bool($puppi)
  $bool_firewall=any2bool($firewall)
  $bool_debug=any2bool($debug)
  $bool_audit_only=any2bool($audit_only)
  $bool_noops=any2bool($noops)

  ### Definition of some variables used in the module
  $manage_package = $sysklogd::bool_absent ? {
    true  => 'absent',
    false => $sysklogd::version,
  }

  $manage_service_enable = $sysklogd::bool_disableboot ? {
    true    => false,
    default => $sysklogd::bool_disable ? {
      true    => false,
      default => $sysklogd::bool_absent ? {
        true  => false,
        false => true,
      },
    },
  }

  $manage_service_ensure = $sysklogd::bool_disable ? {
    true    => 'stopped',
    default =>  $sysklogd::bool_absent ? {
      true    => 'stopped',
      default => 'running',
    },
  }

  $manage_service_autorestart = $sysklogd::bool_service_autorestart ? {
    true    => Service[sysklogd],
    false   => undef,
  }

  $manage_file = $sysklogd::bool_absent ? {
    true    => 'absent',
    default => 'present',
  }

  if $sysklogd::bool_absent == true
  or $sysklogd::bool_disable == true
  or $sysklogd::bool_disableboot == true {
    $manage_monitor = false
  } else {
    $manage_monitor = true
  }

  if $sysklogd::bool_absent == true
  or $sysklogd::bool_disable == true {
    $manage_firewall = false
  } else {
    $manage_firewall = true
  }

  $manage_audit = $sysklogd::bool_audit_only ? {
    true  => 'all',
    false => undef,
  }

  $manage_file_replace = $sysklogd::bool_audit_only ? {
    true  => false,
    false => true,
  }

  $manage_file_source = $sysklogd::source ? {
    ''        => undef,
    default   => $sysklogd::source,
  }

  $manage_file_content = $sysklogd::template ? {
    ''        => undef,
    default   => template($sysklogd::template),
  }

  ### Managed resources
  package { $sysklogd::package:
    ensure  => $sysklogd::manage_package,
    noop    => $sysklogd::bool_noops,
  }

  service { 'sysklogd':
    ensure     => $sysklogd::manage_service_ensure,
    name       => $sysklogd::service,
    enable     => $sysklogd::manage_service_enable,
    hasstatus  => $sysklogd::service_status,
    pattern    => $sysklogd::process,
    require    => Package[$sysklogd::package],
    noop       => $sysklogd::bool_noops,
  }

  file { 'sysklogd.conf':
    ensure  => $sysklogd::manage_file,
    path    => $sysklogd::config_file,
    mode    => $sysklogd::config_file_mode,
    owner   => $sysklogd::config_file_owner,
    group   => $sysklogd::config_file_group,
    require => Package[$sysklogd::package],
    notify  => $sysklogd::manage_service_autorestart,
    source  => $sysklogd::manage_file_source,
    content => $sysklogd::manage_file_content,
    replace => $sysklogd::manage_file_replace,
    audit   => $sysklogd::manage_audit,
    noop    => $sysklogd::bool_noops,
  }

  # The whole sysklogd configuration directory can be recursively overriden
  if $sysklogd::source_dir {
    file { 'sysklogd.dir':
      ensure  => directory,
      path    => $sysklogd::config_dir,
      require => Package[$sysklogd::package],
      notify  => $sysklogd::manage_service_autorestart,
      source  => $sysklogd::source_dir,
      recurse => true,
      purge   => $sysklogd::bool_source_dir_purge,
      force   => $sysklogd::bool_source_dir_purge,
      replace => $sysklogd::manage_file_replace,
      audit   => $sysklogd::manage_audit,
      noop    => $sysklogd::bool_noops,
    }
  }


  ### Include custom class if $my_class is set
  if $sysklogd::my_class {
    include $sysklogd::my_class
  }


  ### Provide puppi data, if enabled ( puppi => true )
  if $sysklogd::bool_puppi == true {
    $classvars=get_class_args()
    puppi::ze { 'sysklogd':
      ensure    => $sysklogd::manage_file,
      variables => $classvars,
      helper    => $sysklogd::puppi_helper,
      noop      => $sysklogd::bool_noops,
    }
  }


  ### Service monitoring, if enabled ( monitor => true )
  if $sysklogd::bool_monitor == true {
    if $sysklogd::port != '' {
      monitor::port { "sysklogd_${sysklogd::protocol}_${sysklogd::port}":
        protocol => $sysklogd::protocol,
        port     => $sysklogd::port,
        target   => $sysklogd::monitor_target,
        tool     => $sysklogd::monitor_tool,
        enable   => $sysklogd::manage_monitor,
        noop     => $sysklogd::bool_noops,
      }
    }
    if $sysklogd::service != '' {
      monitor::process { 'sysklogd_process':
        process  => $sysklogd::process,
        service  => $sysklogd::service,
        pidfile  => $sysklogd::pid_file,
        user     => $sysklogd::process_user,
        argument => $sysklogd::process_args,
        tool     => $sysklogd::monitor_tool,
        enable   => $sysklogd::manage_monitor,
        noop     => $sysklogd::bool_noops,
      }
    }
  }


  ### Firewall management, if enabled ( firewall => true )
  if $sysklogd::bool_firewall == true and $sysklogd::port != '' {
    firewall { "sysklogd_${sysklogd::protocol}_${sysklogd::port}":
      source      => $sysklogd::firewall_src,
      destination => $sysklogd::firewall_dst,
      protocol    => $sysklogd::protocol,
      port        => $sysklogd::port,
      action      => 'allow',
      direction   => 'input',
      tool        => $sysklogd::firewall_tool,
      enable      => $sysklogd::manage_firewall,
      noop        => $sysklogd::bool_noops,
    }
  }


  ### Debugging, if enabled ( debug => true )
  if $sysklogd::bool_debug == true {
    file { 'debug_sysklogd':
      ensure  => $sysklogd::manage_file,
      path    => "${settings::vardir}/debug-sysklogd",
      mode    => '0640',
      owner   => 'root',
      group   => 'root',
      content => inline_template('<%= scope.to_hash.reject { |k,v| k.to_s =~ /(uptime.*|path|timestamp|free|.*password.*|.*psk.*|.*key)/ }.to_yaml %>'),
      noop    => $sysklogd::bool_noops,
    }
  }

}
