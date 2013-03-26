name        "org_users"
description "[internal] Sets up users and normalizes UID/GIDs across machines for better NFS justice"


# List of recipes and roles to apply
run_list(*%w[
  users
  users::user_authorized_keys
])

override_attributes({
  :ubuntu_override_users => ["flip", "temujin9"]
})

#
# Attributes applied if the node doesn't have it set already.
# Override the active_users attribute in the role (gibbon_cluster, etc) if
# necessary
#
default_attributes({
    :active_users => %w[ aseever brandon dhruv dlaw eric flip huston jbro sya temujin9 travis fractaloop rachel schade ],
    :authorization => { :sudo => { :groups => ['admin'], :users => ['ubuntu'] } },
    :groups => {
      'admin'      => { :gid =>  200, },
      'sudo'       => { :gid =>  201, },
      'supergroup' => { :gid =>  301, },
      'flip'       => { :gid => 1001, },
      'dhruv'      => { :gid => 1002, },
      'travis'     => { :gid => 1019, },
      'aseever'    => { :gid => 1020, },
      'temujin9'   => { :gid => 1022, },
      'huston'     => { :gid => 5004, },
      'schade'     => { :gid => 5006, },
      'jbro'       => { :gid => 5007, },
      'sya'        => { :gid => 5008, },
      'dlaw'       => { :gid => 5009, },
      'fractaloop' => { :gid => 5010, },
      'rachel'     => { :gid => 5011, },
      'brandon'    => { :gid => 5012, },
      'eric'       => { :gid => 5013, },
      'jcorso'     => { :gid => 5014, },
    },

    #
    # Want your password auto-set? Run `mkpasswd -m sha-512`, type in your password when prompted (it will not echo to the screen). Paste the magic gobbledygook into the :password => '' part, below:
    #
    :users => {
      'flip'          => { :uid => 1001, :groups => %w[ flip      admin supergroup      ], :comment => "Philip (flip) Kromer",        :password => '$1$t7JKsiMn$VEasO2Fq4d1qmN7FwFy6T.',                                                                        :public_key => 'ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEA1xgUGYGjyZpLZpj1YZyIfPNsFAImwgXaiKA0ZFmYMkdkgmwArHKvumt6HWGiBcmSRYNhzJKNk44IbtIWf4kYkJ8InYmBn9l/rHakbmAN+xbYzHhX7ldG513TiVWSPg5qj5/yZaES44um2FbeLdCd5BFOkvcyYi30accri/SZiF6u1MD9BOprs/RP9lmzPr0+fGEH6adF80m0x25toH/1tcSzRNamKOqf+5WGDLSaistKc1GPRhmNmUY1585yyL9CpgM+j9O6p1e/R9WXdPZPNXFhuV4vsK5LWYAe6KSquVmlpRyLitDlRatCuLgvfXWkyYI8xLogQ4DAE9dP3XSIZQ== flip@silverback.local'
                       },
      'dhruv'         => { :uid => 1002, :groups => %w[ dhruv     admin supergroup      ], :comment => "Dhruv Bansal",                :password => '$1$u8zug0Hd$wSOfz0j154AVKtnWoMKrJ1',
                       },
      'travis'        => { :uid => 1019, :groups => %w[ travis    admin supergroup      ], :comment => "Travis Dempsey",              :password => '$6$UDadkHkD$gpXF8GdsVuRu4111rgQtJhQ.tj/wuaUmwHERbn8g076di851F/mWD7jAeRx1r70Eo1GRbupcJ8sXdE1AB43v8/',         :public_key => 'ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEAkzOMicqr08DhSk2vHal5TVcf++NgTJS9/A5m2vIhEtlNe+MpPW2CR7Z4FUaQqIIdDpEaHPFFNf2O6NGVYS0Z9pE5EQgvK2AmkexQ50V0OTXF5b6TSdLzJ2KPFrInbwv68YAgCT6/ZWzeVd1o65pHKQr+NsyajCF40MnDuOMyRR2OCV/d6h6ZkX1WnXmVJ7TsU2lZ+V7qfzyEyKTnG0HSawXHQiAV4ER6oHpZ12rkrkrFqGsbHgwPX7c7LGrY4+Kju1cUpuUpJny9jLdvyf4Jeg/IEGTKefi2xN3WrZEnjvRqH9KiPhgaWUVqHOgId/M8fkOZmyx5SDRvU4ovRDmp/w== dempsey.travis@gmail.com'+"\n"+\
      'ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEA1eLHkhJzCr1VKTAQxvMmLjbBXhNkAamyDYrBnZS3+lR/pxEQ9n+vbeTHAFnNgGTZLXSIQCW98CenchaQj9cT5BG4Ey1223cUXtzToLBDhJ8M9EQMYdPdH1cJJxh7MRCsn3dvYmtoCXJWl7wWw83pFETB5bWTtah7FDEI9fKZkgieK96ocuz5zSq+FNa+rInK2VQUmNhjm+KcZH01IAclwpDtws0/FKwmu8nYercelfkgGVslGx9ahTtBYJhDac9wbd4BiRMAYLUzo5tISmcqIJ1FRKNfw5xuqjMbXPPixchvjw581PjCTorcHIf6WtZkCTpy2ZjJyGIBdqONFgB+Dw== travis@aberinkula',       :shell => '/bin/zsh',
                       },
      'aseever'       => { :uid => 1020, :groups => %w[ aseever   admin supergroup      ], :comment => "Adam Seever",                 :password => '$6$h9hLtEnm$YMGDgBA4oUOpIwZavR2gxHCO4fKD1Oa/vwl2l8jSR8p8xALORfb9gPZGH1WH5iuizMG04WBQCGq3WGNnJVdPv/',        :public_key => 'ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEAvVYKur9yQxM1otdKQuVzT04P/DTq52hi6fWhUxuDOqTjiiu143sEf5tkedY+kb022F2GFyEvxhvaEmBv/7nfa+SENaYprPq+MzInEN8MVh+Y4YOQqowdrQVQ05NHoP7SUTK7fQOsdu8IZIpBexOgPMJkVcLdqPWBrp3xsaS87QSp1+jhX7CSUQ4FUanf/wNFKUWqyryB+2a4cwq2j4VgnbSuIXUIB3vfgeqQIvcxjd7B9YH8Yc9wa6twld6hnVEpfZxkUMFvj2mQKUkx+/axYWXKUGyO3fvQRAlYrAkQSQzfIsSOx8JoQgesFudNSDATNQ0DLg5fYQEQ+Q9TFOsASQ== aseever@m'
                       },
      'temujin9'      => { :uid => 1022, :groups => %w[ temujin9  admin sudo supergroup ], :comment => "Nathaniel Eliot",             :password => '$6$/zaQdPyrfc7I77$iBnKdkIquqfjbGYBoOU4EH4nK0K/6Ecs65FY4HPeNh79zS6/g7B249l7COfLgSNU7bJUMX3NstI9Y8sLkeYRj1',  :public_key =>'ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEAwXJFunj3ZkLwf1eGHueUf+xYFRux+p18Ef9byVaRdZjrIitJ0JDh/PCwCdJJzkxXNgyoh7UjsJr6CCU3/b0n8bhXCiyV1e1z1ndp+9ct1fXwAnTtuFeBPhg1Y7LMxKq3SpQ9zXJfBa8qwXxAZX//8FVvtIBuUo7JVXo0FKf8tZzlhf6X2J1ujEA+/WRxDBupw5bvjgVfxtArvwHlqEluz4JKANiQ3FPu8C3MGA0QEtUurrMTEtHvohFxse8nzYAhsvyGiqYH1W6+OKs6maqpgtGVQ19DP6Z3qb/MgmhmfxnfnHiuVexhojfc/Ap3eLfmgFeJzDUhWTdJfLf/GBR72Q== temujin9@yurt',
                       },
      'huston'        => { :uid => 5004, :groups => %w[ huston    admin supergroup      ], :comment => "Huston Hoburg",               :password => '$6$x/PKJcF8Bjcv5FQ$j6NCqwCU/osIQNMKLiJ7KR4fd.X0pUHY0YyrdDiMwz8es9cIKCH/ZzgT4mEseaV88HSlGZyIWdOIMwsIyc9Vl1', :public_key => 'ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEAkDFBk1VYf1WpLReTp66Tv1ycnjsaTCnFrhcnrtGTd1dviiISd7JFwuMPhYZEDKBNttWiDBfighpnDUEgd9+03DXiaCL2KsNAvd3rqb2+WNY81lMLmoK6ruu0+v3F2S7yHvUsp7gcfyRCWPuG5qGhK8N00fmiQmLnvyTZOhx3KE/bCxcgaEwf34hL5+dc46lRBJL42Z9QfA8qrETWHrlq6oGhe9dQeiDIQ+Ja+5ewoGstHbMCh143pRaFCjV2eYEEfjc7IuiaEKo0XTLs1AGtp2FSTnVE3lVcmWKsdVYfndgCWvSjwgjm387ICO+TbDWZxnra3LYPlZqLXPQ5QME1jw== huston.hoburg@gmail.com',
                       },
      'schade'        => { :uid => 5006, :groups => %w[ schade    admin supergroup      ], :comment => "Jerry Jackson",                :password => '$6$0iVtehup$qa5dxpzu23nz5fXO1GMq74MvQhJkjFJ7QLS39WbgMVCqS9w0WnccEW8QiTO6NLTuxMOEcL45JVXePnoEBpVu.0', :public_key => 'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC+ZLZvWDaADrHgKPBxk+wW3MyogQJPCYxTi49PR6CeSq/c//dzAZr08c2D/BXQoa4HgQtpnUAkVXUUwLw8hAJBQzNVNVK6LihEzzf10vNXAL7uyvaPRsYEUuyTczDXvUX8e8iW7s8bECtnQ0eHujBeC2Mf50/IfF7EPZaeVDSAmrDINxgj3ZWO+2XNpmOpL2y7UwmUYpabeWiDfBfZYTJrRXWMV9bGjNlbrexc8KCc5GHrqiGk8nLbuYWWNbFP4avfacyTtSaLn5MKO5iMS+HvYukmHe2c2KV61Ay9eJhmSkDBnUZm04lR3wpYxBtkaTEkNN5DjqnvIwaWBTyI1IoF key for various'
                       },
      'jbro'          => { :uid => 5007, :groups => %w[ jbro      admin supergroup      ], :comment => "Josh Bronson",                :password => '$6$DLr8JatzhvN88$5Jm5PG99dq1QIaH1nFdhDVXSEiWvANAlCLQCIW5AFa01jUnHTjfZCnEFSXF5vXDZrL4yYl7RmX8guG5eOyOEh/',   :public_key => 'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDIMdyoJcaVF/bnNwLnfJ3nEPvS/t1qFKLsyKgCVUVlSddxmQLOGCFSoXugG/Jfuhn329O+ojr4K8sDyMPqCbSlPp8ByfGsGaIz8DZ6XY67GfT0SDWbMSd+FGMzz8fH2jZA/zpX6Ixvvv+3WnLt9c1tdZDsoFD5sj2pltWZFqYotGU963yIPGzbCYwanq4Fu7bmM5558PxFky3Bq3b0DJ+UPCA6VpCQgMbJobx/NEobaTAadid8jHxKRDL5rc1Eni3mw3H7LqL10gyjwa4UqPvsbBvGkq0/cKDXVvHhhJF1D4BzjrLHe+yReSoAP/SK6IPBTQ1qOEwLt5z0h68Qngn5 josh.bronson@gmail.com'
                       },
      'sya'           => { :uid => 5008, :groups => %w[ sya       admin supergroup      ], :comment => "Selene Arrazolo",             :password => '$6$9ko6oa38$5iQW9Hi3hHNokMpce7hVQVEXo0VvQACb1GUbBT2MB9KpYn06XB5lySWpFEygsZUUJE3H7t4E43BJIyhpGr54N0',        :public_key => 'ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEA6VFIMS7F9i9yQ1+9o6mDFMmYRw797yJNYDWFISWhYzFblI0wECl9h/evd0kctQCHYD0zcvILxOasacGW5XufRwjWx9o6iqwAllr0D3qVm5OzZrG67RWjBBbBm99M3BcHLgElF9eNhjS7UfEjTbiWADXpV9LqgUnczXVgpCGAJrp5chKrZUiOwrft7nTukzudfzrRN1pQnOowRjLBB/ejWMEVxUwEvo3b7pthe+YXTR7mwVwmLlZF2EOOJKf65NS1houRdppVB4BRPX2lXQ/Qu2R0VOR7tk28xy1aarat/csjuEjjsYOA3GUikBonLzv19aeg5ndadSAcLI5MrgYP4w== selene@Futhark.local'
                       },
      'dlaw'          => { :uid => 5009, :groups => %w[ dlaw      admin supergroup      ], :comment => "Dieterich Lawson",            :password => '$6$HJRQ3NRW$JsIxoGdl2NwNOgnuSYAucHLezCnLvD11QgBt7kI80d90lYegTKDDs9/ZjzjR9pbB0aM1V4jCXZaW4qXirCWZx/',        :public_key => 'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDxsKCEnOv7SVFq+Mga+3LB42UtKpTo9si/Mbv9fweO5g2B4KGIG8v+0Qkh8wOZMBLXDvdLlDGx7WKoFzEUK7apCMjoSG8FYYJp+P7lB2J5v2iQrol7C7RH5XxEp7LthrjGBspaasayA63eugEBRHDfCcYt5pKwTSk2muCjv9ube/4B0MR5rFoTzMNfMPpP0x6yeBzWqtgliEKx+/UPy2fzFAlKppF3dKg9JgupRU6GK+fOWzSv6BWtkrmtzYIiFUbSbgKem67Llmnp9QgRdDOUPSyuHrQmDs+F7DGUvY6lexYiSMGHKH55H138WiX9DFDeRgp8jG4mf3TbZdgRpian dieterich.lawson@gmail.com'
                       },
      'fractaloop'    => { :uid => 5010, :groups => %w[ fractaloop admin supergroup     ], :comment => "Logan Lowell",                :password => '!$6$UVd2nbA5uYQVQgw$GaD9Ww.7emOC.LjC/DmW4K76BciGiw9uBBpt61oopEWdV63yjULdiMqaGoairZ9/FE6Kzu2wMo4TTM/dzsw0r.', :public_key => 'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDfvwNDjMILmTrfIXDOeh6XkSmfJbGDl0brcaZDaWQRUa/PY+eHL1b+PqAL5SzDtuLOU0V5I4Q7bQd5lzGQ9jJs4bdkFOuyFgQVDDnO3JtuyDl1w3Nugvejc5iOu1kcAp+uECmB++HojDAXLznjzev91Lv7IrDrbXihuFu20Sb01obsOiNYrSfKhdrnQqijsC33vSjA08KbH3jVbGWp/xesebF6pDm4CH/n+RQmsGvqDHcxQZVGVnShMYLYa8kzFQYXmZEE2j9dd2bOS3ZkhHUdtNOytz67TWoKzv0H0VBfKB0bD8aFYkX/NgX66hGOZmR1F9X3wE2a70iuaKh7JS/H fractaloop', :shell => '/bin/zsh'
                       },
      'rachel'        => { :uid => 5011, :groups => %w[ rachel     admin supergroup      ], :comment => "Rachel Mccuistion",          :password => '$6$LrFhfGunca0$Ez/QFhILbX64/CRIUJemmgaZAgs4ksMovSMUZZqNGQ8lztt8T1MotkRznOPtxuhgA8LNy9CJCg/2kFtVec7ql0',     :public_key => 'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCyH7nlE2FZeceOBN+nBLT8eqfsAvPABZS/4ApXy5vptcFm2IXMF0xFvWhJrWUJiULn5sNAsSnm0DefYUDR001aPZbjHXaydm7LqKwUAc4FXb5xP0cCPMer4CF63RsDf5KSq4MC3nLs1+xR5f6QI4UMBydBWdnA93lBH4OzBZ48CRW53tbhWEtjaO4b8aBaMA3V35FUNCqzVZqAoVeSmq128BAMdyvgm3t0khicLMu3l9w7YqrMlEKmnSCBUOLx4pBDjv60cLrlLOLum7HzNZFHl85JVHxbxq/9QKal9B/+jNoqr8av9dJ1jhceLtX5F9UVXXDLDAq/CAxZFiKpD72n rachel@localhost'
                       },
      'brandon'       => { :uid => 5012, :groups => %w[ brandon    admin supergroup      ], :comment => "Brandon Bell",               :password => '$6$nD/quDNfOwnzOuT$AotkG8fRNrfIUli0dCImx6Z1sBVYT7zgYdtHzZEMsfNpcZ3omvOi0w8UyY2X8WgtfaH4SqAP3Texju/1C9NgY/', :public_key => 'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCtRtYyt41h651xyY30maDdrWZ9bSK6byS6G6xmMWmXFVlsgYFN+doX0vwtzaofIwNZnPcW8QrsjB5iwgnJIhYF4z1sFV7LFKcs7fGkLXxTYBKkHJbL/MJngCb4lOySjq+bxLxTfY+52fN58N1c6ooAGbOx2TMW+fwXT2bUkHduFIOjwmeyTTdiC94faaPE3b8WIsvI/1eKuuyyj5Rn9F9pxxaGtkLtqSF7D9sAAGnVvqrY5n9ePXcLq/1pXQhO+blUAEw7nSrSY1hEiLgmTfHytWK8wBE3lmkM2ohuT+Tekp/qbjlx14lfe1q4C4SyQaBiaFXhF/DQWhaXUtGF1ByD brandon@MegaDinosaur'
                       },
      'eric'          => { :uid => 5013, :groups => %w[ eric       admin supergroup      ], :comment => "Eric Katerman",              :password => '$6$X6zdfNy8$WEgcwjXOuReXCJXXHcX17F6DHumCG5KWJxMeWp6Gx8VUtIxeiDGuM7YmIIfzExChyi25x5T23L6FJMk5tMYcm.',        :public_key => 'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDJRQzwdrypke0TsMSe/iTrtjbvoZQ+K3vnov1ldUN/Kvz6FG8R3aabNbW+Lbzj8BgQ4NvjFtUtdDZHQJhvk+DUSF8W5mI7tc7QP/0ALVyehhK79bcOYVAT9oI9Zr+jMFvom4XZZ6p/M7K/kzFq8xmUsFoM/tFjTm+NecsX5MSJc2doPaeUlXbcM+cUeVLTmj5ltA6MX7oEWGUmUaC/nP+5C5/1uRQTck2KlhugAQQjXUv8qHrA80meM2GfMhXKkOVfKCZEKwInQefw0Zy0NXgHusgHyu9vZOd892GwxUK/mpOeMQGOH/a/A+fifzEaCk7jtTO8ktomUg+K85Peid4t eric@infochimps.com'
                       },
      'jcorso'        => { :uid => 5014, :groups => %w[ jcorso     admin supergroup      ], :comment => "Joe Corso",                  :password => '$6$qAnDgBX/acVf$gVgJVaVKs7MC//cIyD0Yp7W7pVK8SP97HO2ZDZsqndELzIza6uwfUKhVZ87L8D2WxeBTPSqJEYD5q.cn6ZiN..', :public_key => 'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDDFmdE73qBpO16mDJrqu+2Q6XHJasErI4Fd5Y33NWzI9DHf/QrmOETN2jhuAe0eok6kzlBWqmCsowRqZ9Ji0RZfp58d1MI4ok4JhDTvDzATd3JmPeOIZQ0nZKBYfZE71cqZPgtxB1Yb5H1tXLpHLT9Ytva10Jgx4qnQzou7SPjq5S3iwb+LqL1dee56jY8qRa0f+5gYeTuu3yKt7Lq6RsB9hjFuC45hhc5MEhy+CMqCR1WoQZOu3cjGwWKOo/U4oSI/yMqUzLRH00uweWfmBIuKELxjN4ZOuO93m9eFMFp9+LNC5wqAPfEHhmBbAbhoukBtsRTQ83lmfo1LYKbOf2J dhruv@silicon.ph.utexas.edu'
                       },
                     }
                   })

## The following are approximations of the result of various invocations of
## the daemon_user definition in silverware, and are for reference only.

## System-defined users
# 'www-data'      => { :uid =>   33, :groups => %w[           webservers www-data   ], :comment => "Runs the web server ",        :shell => '/bin/false', },
# #
# 'hdfs'          => { :uid =>  302, :groups => %w[ hdfs      hadoop                ], :comment => "Hadoop HDFS User",            :shell => '/bin/false', },
# 'mapred'        => { :uid =>  303, :groups => %w[ mapred    hadoop                ], :comment => "Hadoop Mapred Runner",        :shell => '/bin/false', },
# 'hbase'         => { :uid =>  304, :groups => %w[ hbase                           ], :comment => "Hadoop HBase Daemon",         :shell => '/bin/false', },
# 'zookeeper'     => { :uid =>  305, :groups => %w[ zookeeper                       ], :comment => "Hadoop Zookeeper Daemon",     :shell => '/bin/false', },
# 'ganglia'       => { :uid =>  320, :groups => %w[ ganglia                         ], :comment => "Ganglia System Monitor",     :shell => '/bin/false', },
# 'flume'         => { :uid =>  325, :groups => %w[ flume                           ], :comment => "Flume Data Transport",       :shell => '/bin/false', },
# 'cassandra'     => { :uid =>  330, :groups => %w[           databases             ], :comment => "Cassandra db",                :shell => '/bin/false', },
# 'redis'         => { :uid =>  335, :groups => %w[ redis     databases             ], :comment => "Redis-server runner",         :shell => '/bin/false', },
# 'super_herder'  => { :uid =>  339, :groups => %w[ super_herder                    ], :comment => "SuperHerder worker",          :shell => "/bin/false"  },
# 'mongodb'       => { :uid =>  360, :groups => %w[           databases             ], :comment => "MongoDB user",                :shell => "/bin/false"  },
# 'jenkins'       => { :uid =>  365, :groups => %w[ jenkins                         ], :comment => "Jenkins server user",         :shell => '/bin/false', },
# 'jenkins_worker'=> { :uid =>  366, :groups => %w[ jenkins                         ], :comment => "Jenkins worker user",         :shell => '/bin/false', },
# #
# 'nginx'         => { :uid =>  402, :groups => %w[ nginx     webservers www-data   ], :comment => "",                            :shell => '/bin/false', },
# 'robochimp'     => { :uid =>  420, :groups => %w[                                 ], :comment => "Cron jobs and scrapers",      :shell => '/bin/false', },
# 'flying_monkey' => { :uid =>  421, :groups => %w[ scraper                         ], :comment => "Flying Monkey Scrape Worker", :shell => '/bin/false', },
# 'rundeck'       => { :uid =>  444, :groups => %w[ rundeck                         ], :comment => "Rundeck daemon",              },
# 'graphite'      => { :uid =>  446, :groups => %w[ graphite                        ], :comment => "Graphite daemon",             },
# 'zabbix'        => { :uid =>  447, :groups => %w[ zabbix                          ], :comment => "Zabbix daemon",               },
# 'phantomjs'     => { :uid =>  448, :groups => %w[ phantomjs                       ], :comment => "PhantomJS daemon",            },
# #
# 'cube'          => { :uid =>61323, :groups => %w[ cube                            ], :comment => "Cube",                        :shell => '/bin/false', },
# 'elasticsearch' => { :uid =>61021, :groups => %w[ elasticsearch                   ], :comment => "Elasticsearch",               :shell => '/bin/false', },

### System-defined Groups
# 'hadoop'     => { :gid =>  300, },
# 'hdfs'       => { :gid =>  302, },
# 'mapred'     => { :gid =>  303, },
# 'hbase'      => { :gid =>  304, },
# 'zookeeper'  => { :gid =>  305, },
# 'ganglia'    => { :gid =>  320, },
# 'flume'      => { :gid =>  325, },
# 'databases'  => { :gid =>  331, },
# 'cassandra'  => { :gid =>  330, },
# 'redis'      => { :gid =>  335, },
# 'jenkins'    => { :gid =>  360, },
# #
# 'webservers' => { :gid =>  401, },
# 'nginx'      => { :gid =>  402, },
# 'scraper'    => { :gid =>  421, },
# 'super_herder'=>{ :gid =>  423  },
# 'rvm'        => { :gid =>  427  },
# 'rundeck'    => { :gid =>  444, },
# 'graphite'   => { :gid =>  446, },
# 'zabbix'     => { :gid =>  447, },
# 'phantomjs'  => { :gid =>  448, },
# #
# 'elasticsearch' => { :gid =>  61021, },

serve_meal