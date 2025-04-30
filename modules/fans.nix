{ pkgs, lib, ... }:

{
  boot.kernelModules = [ "nct6775" ];
  boot.extraModprobeConfig = ''
    options nct6775 force_id=0xd802
      options nct6775 force_pwm2=1
  '';

  environment.systemPackages = with pkgs; [ lm_sensors ];

  services.udev.extraRules = ''
    ACTION=="add", KERNEL=="pwm2", SUBSYSTEM=="hwmon", RUN+="/bin/sh -c 'echo 1 > /sys/class/hwmon/hwmon2/pwm2_enable'"
  '';

  # Fan control script
  environment.etc."simple-fan.sh" = {
    text = ''
      #!/bin/sh
      while true; do
        temp=$(cat /sys/class/hwmon/hwmon2/temp1_input)
        temp=$((temp / 1000))

        if [ "$temp" -ge 70 ]; then
          pwm=255
        elif [ "$temp" -ge 50 ]; then
          pwm=150
        else
          pwm=80
        fi

        echo "$(date): temp=$temp → pwm=$pwm" >> /tmp/fanlog
        echo $pwm > /sys/class/hwmon/hwmon2/pwm2

        sleep 5
      done
    '';
    mode = "0755";
  };

  #  systemd.services.simple-fan = {
  # description = "Simple Fan Control";
  # wantedBy = [ "multi-user.target" ];
  # serviceConfig = {
  #   ExecStart = "/etc/simple-fan.sh";
  #   Restart = "always";
  # };
  #};
}



