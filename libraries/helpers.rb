#
# Cookbook Name:: kibana5
# Library:: helpers
#
# Copyright:: 2017, Parallels International GmbH
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

module Kibana
  module Helpers
    # Returns download URL for Kibana artifact
    def kibana_artifact_url(version, install_method)
      return node['kibana5']['url'] unless node['kibana5']['url'].nil?

      case install_method
      when 'release'
        "#{node['kibana5']['distribution_base_url']}/kibana-#{version}-linux-#{kibana_arch}.tar.gz"
      when 'windows'
        "#{node['kibana5']['distribution_base_url']}/kibana-#{version}-windows-x86.zip"
      when 'darwin'
        "#{node['kibana5']['distribution_base_url']}/kibana-#{version}-darwin-x86_64.tar.gz"
      end
    end

    # Returns SHA256 checksum of specific Kibana artifact
    def kibana_artifact_checksum(version, install_method)
      return node['kibana5']['checksum'] unless node['kibana5']['checksum'].nil?

      sums = kibana_checksum_map[version]
      raise "Kibana version #{version} is not supported by the cookbook!" unless sums

      begin
        case install_method
        when 'release'
          sums['release'][kibana_arch]['checksum']
        when 'windows'
          sums['windows']['x86']['checksum']
        end
      rescue
        raise "Install method #{install_method} is not supported for this version of Kibana!"
      end
    end

    def kibana_arch
      node['kernel']['machine'] == 'x86_64' ? 'x86_64' : 'x86'
    end

    # Returns SHA256 checksum map for Kibana artifacts
    def kibana_checksum_map
      {
        '6.8.2' => {
          'release' => {
            'x86_64' => {
              'checksum' => '34566f24f8c4606e247f69068f569fc0aeebe186215f4f5feb6513f913ff2724',
            },
          },
          'windows' => {
            'x86_64' => {
              'checksum' => '02414b0f7f60411ebfca7496621358603f365ab381de62d95780dd9f87aee47e',
            },
          },
          'darwin' => {
            'x86_64' => {
              'checksum' => '0203e01a843e736c1645b0518d4a439d6996a70543cc81b7f47408f5378e383f',
            },
          },
        },
        '6.8.1' => {
          'release' => {
            'x86_64' => {
              'checksum' => '45cc8c47286f218abbdab04ec502b5de99c86e3da2e8debadaeb99ac79391e02',
            },
          },
          'windows' => {
            'x86_64' => {
              'checksum' => '03e2ee5fa4a1bde0549ae316a7c4c0b8f1dbb6c94fdcaf1e4be7e716c27fbb39',
            },
          },
          'darwin' => {
            'x86_64' => {
              'checksum' => '7061af96687a691f1815a061896187dfda5ec8bf79d211d1ef3743f05dd525d7',
            },
          },
        },
        '6.8.0' => {
          'release' => {
            'x86_64' => {
              'checksum' => '6f4d7323a12f3dd2078c0289e334dbd0bc9659da315b8a2ec91fcfd5efd20776',
            },
          },
          'windows' => {
            'x86_64' => {
              'checksum' => '5cfb592b9231c77ad2e2f46b703d86f191c53ae1c46bbce6c860dcbb4cfb2982',
            },
          },
          'darwin' => {
            'x86_64' => {
              'checksum' => 'e19aa9fba9384ca91381c5d5f2d312b72a6f7100e56e143db771b6c3608edde2',
            },
          },
        },
        '6.7.0' => {
          'release' => {
            'x86_64' => {
              'checksum' => '5e88dadbedef9be6c388999210c80eb3c04e453fe4c9c02662e15efb40d3b40e',
            },
          },
          'windows' => {
            'x86_64' => {
              'checksum' => 'a725274b54a613c7f64b6ba050cbcb571bb52a8911845923677836373ea82cab',
            },
          },
          'darwin' => {
            'x86_64' => {
              'checksum' => 'bb500fd706c51fae5375c531ea1338f2836d584582932965b7e6b0a99a9c41e3',
            },
          },
        },
        '6.6.2' => {
          'release' => {
            'x86_64' => {
              'checksum' => '45b32f6053c683bf8ba2cb0841c1ee705e524586a2aa3547afcca629fea0a6b0',
            },
          },
          'windows' => {
            'x86_64' => {
              'checksum' => '5e15d1c4e183fe22fe47d86dec3c068c6a46ec46cb37d44cd5e1ccceac991a2f',
            },
          },
          'darwin' => {
            'x86_64' => {
              'checksum' => '4109dc969d572b87dd05ef95e32ba0afddedb250c150d46e2b428ec4a4431822',
            },
          },
        },
        '6.6.1' => {
          'release' => {
            'x86_64' => {
              'checksum' => '9a29eae0edf71450dc4a5d1e30dec9afe64f75d95d26572e208dad3adc36f975',
            },
          },
          'windows' => {
            'x86_64' => {
              'checksum' => '24b2467b512eb4197eec9a170c0eb59e5e6c6dec776bcad6a4f1c8de7e7db4ab',
            },
          },
          'darwin' => {
            'x86_64' => {
              'checksum' => '85724d4fec3cd6cf79b78182296568f822b7726acaba61d31556c86c8c4f7080',
            },
          },
        },
        '6.6.0' => {
          'release' => {
            'x86_64' => {
              'checksum' => '8b3cc99e6e6d5f5559fd858b43befb16cf65994375b4e904ec3a702aba947865',
            },
          },
          'windows' => {
            'x86_64' => {
              'checksum' => '82150be20d6a7a149e8f12439f0751e9a93d8ccd60dcdfdcd6576f484baedfcf',
            },
          },
          'darwin' => {
            'x86_64' => {
              'checksum' => '924a087119915c9c355e6c212d704586a9d063c25eae17dea6988311f3bce336',
            },
          },
        },
        '6.5.4' => {
          'release' => {
            'x86_64' => {
              'checksum' => '7a511725bb43f136037c3ca12b2a379497745f81f6af9b75486f7f5f3a3a9653',
            },
          },
          'windows' => {
            'x86_64' => {
              'checksum' => 'da990f86478021c8ca79643b5d0cadfef6066ebb3c5efe70866b71571c2bf6a2',
            },
          },
          'darwin' => {
            'x86_64' => {
              'checksum' => 'b5fc06efa63eb302224922af90272e7033b04c0cf31704ed6bd2a93534d362aa',
            },
          },
        },
        '6.5.3' => {
          'release' => {
            'x86_64' => {
              'checksum' => '4a424a677798592455703239a15e474baecd400e940886c74e402ae9940f7720',
            },
          },
          'windows' => {
            'x86_64' => {
              'checksum' => '18dfa7ee6893776ea1f07a07859eb03476dc381fea41aa92fc950e493a651e91',
            },
          },
          'darwin' => {
            'x86_64' => {
              'checksum' => '34439306069aaed252fdbbf70e7299875a61d352656202438ebb725196a92ad8',
            },
          },
        },
        '6.5.2' => {
          'release' => {
            'x86_64' => {
              'checksum' => 'aa17ec706aab6e419b65333d25054d3a99749938fdb9399572f3eb9e7d6d00cd',
            },
          },
          'windows' => {
            'x86_64' => {
              'checksum' => '69b2fc980bc3ae741222f103c797ee8df2d2f4d900386db580ee9f47d74070c1',
            },
          },
          'darwin' => {
            'x86_64' => {
              'checksum' => '01fcd50304705fd5d6919b24e202757b6d07d11278092e2c6a6bef21582234e7',
            },
          },
        },
        '6.5.1' => {
          'release' => {
            'x86_64' => {
              'checksum' => 'bbbcb59cc3f5e9b8e4dd747c72437360b101ae6d29f1e6df40fb2b39e4223752',
            },
          },
          'windows' => {
            'x86_64' => {
              'checksum' => '36cf357c683ef00e95811a70fd4b433fb5a8a9d85f1fe6b783cdeeae9fb70559',
            },
          },
          'darwin' => {
            'x86_64' => {
              'checksum' => 'a3729b5579b19dbbc1fa2c9deb1de9566ae2eb07dc64efd8857271f614b64d42',
            },
          },
        },
        '6.5.0' => {
          'release' => {
            'x86_64' => {
              'checksum' => '9fc9edd5730843f6622bb845ac4edda7f48e8d38dc78cda154d453925a2c1e0d',
            },
          },
          'windows' => {
            'x86_64' => {
              'checksum' => 'b1357d5e9b81b386ceea6f05d5a0104d36051f816b4fa20cdea7d07b004d66f6',
            },
          },
          'darwin' => {
            'x86_64' => {
              'checksum' => '6d98807f681acd240d464144405a6ca19a8cc6ee680afe5e5cb20745e1b9130b',
            },
          },
        },
        '6.4.3' => {
          'release' => {
            'x86_64' => {
              'checksum' => '5f1fe4f464bbfeccbd79c620ad728c1537b6f92af54b31e9cc7c4e86adce4c2c',
            },
          },
          'windows' => {
            'x86_64' => {
              'checksum' => '1d744e0e0822d03c933220a3314ae1dcdb7e36be06be1fdabca6d1a4dd7d3fbb',
            },
          },
          'darwin' => {
            'x86_64' => {
              'checksum' => 'ac70e261057f85557bad5035c6ed939c54cd09ea4ff8a831692a9a59f8212e4a',
            },
          },
        },
        '6.4.2' => {
          'darwin' => {
            'x86_64' => {
              'checksum' => '1078c4c5ced83459726522a268510e1c99d5e5f4fef7284c3b39ba8ca9c59bf2',
            },
          },
          'release' => {
            'x86_64' => {
              'checksum' => 'f3a69709171ea8e28da754578ec519f33c423d3e3cbed6e81381f14cb8517383',
            },
          },
          'windows' => {
            'x86_64' => {
              'checksum' => '91d986ad26f077337003a22acd78292802d20378dfd5b54a01ccceac2cdd072e',
            },
          },
        },
        '6.4.1' => {
          'release' => {
            'x86_64' => {
              'checksum' => '6c6fa47450cb05b96b97166a627d07c76591909da82d3bca0708bdebb889bf86',
            },
          },
          'windows' => {
            'x86_64' => {
              'checksum' => 'd6bf3f8e1bed118e1ef89f755feadfc0bcf63b491f0e709cdd17b2f5bad425d8',
            },
          },
          'darwin' => {
            'x86_64' => {
              'checksum' => '99329cd263d080a0df3e2792283b60a02b2e5c990477255b0027826cb7419a9b',
            },
          },
        },
        '6.4.0' => {
          'release' => {
            'x86_64' => {
              'checksum' => 'df2056105a08c206a1adf9caed09a152a53429a0f1efc1ba3ccd616092d78aee',
            },
          },
          'windows' => {
            'x86_64' => {
              'checksum' => '6ebd2cd3e2b030f864e4ab2d552aecce8cb52155add7b77150857b71a1cf0d04',
            },
          },
          'darwin' => {
            'x86_64' => {
              'checksum' => 'abb074fc31c78fa6a6a82caf479dcc8162db75faac93d05b3d331acc2f37b11c',
            },
          },
        },
        '6.3.2' => {
          'release' => {
            'x86_64' => {
              'checksum' => '605bf5e991d206b5b2799ef5210644c50192cad6a239662a8674d57fdf3b69ce',
            },
          },
          'windows' => {
            'x86_64' => {
              'checksum' => '33aa8a56fcef24cee437bfa1c26338698d4174871dbbb2ff924150e71ea77732',
            },
          },
          'darwin' => {
            'x86_64' => {
              'checksum' => '8399b9c1c9413297e3666f5d209989734f736a58c4290aa04879a186a6737cf7',
            },
          },
        },
        '6.3.1' => {
          'release' => {
            'x86_64' => {
              'checksum' => 'b226ae395880379d051385d6453699e9861ff337ed380fd6d636b8a0aaae7dd1',
            },
          },
          'windows' => {
            'x86_64' => {
              'checksum' => '84e664c107504caa538646737e1e1b011d26337d7e72743f369053ebeba14de4',
            },
          },
          'darwin' => {
            'x86_64' => {
              'checksum' => 'b89e587822608c06cd9dc86f4f38896c463166de75ceee5e909b460cdb9e3201',
            },
          },
        },
        '6.3.0' => {
          'release' => {
            'x86_64' => {
              'checksum' => 'f3d89d6d7239138e57ca87e834c52057db97a7acd7b6c0e6ac2ea642674c6992',
            },
          },
          'windows' => {
            'x86_64' => {
              'checksum' => '07a26ac62e9a1c20d975b81d70de216351369dd54848c7e0c9e8de6f14208e95',
            },
          },
          'darwin' => {
            'x86_64' => {
              'checksum' => '0f837562a18668cb5f6e93c8ef4b7467940445c3599483f137e86c809a4c55d5',
            },
          },
        },
        '6.2.4' => {
          'release' => {
            'x86_64' => {
              'checksum' => '53fb5ddcb3055209f8e3dffcad62d24bdbdedbe8e2f66c1773bac4a1f8b629af',
            },
          },
          'windows' => {
            'x86_64' => {
              'checksum' => 'd9fe5dcb8d4d931317d25c16ccaf2e8dbc6464eb1dd22d081c33822d2993dab4',
            },
          },
          'darwin' => {
            'x86_64' => {
              'checksum' => '3142ab35f9387827439bb05da1d25a673101fe177e4f142aa2398328c0648df0',
            },
          },
        },
        '6.2.3' => {
          'release' => {
            'x86_64' => {
              'checksum' => 'ad3086fdd7560d3b6edb0e47b7672adbac439c28746662cea449e287d79e3e96',
            },
          },
          'windows' => {
            'x86_64' => {
              'checksum' => '386dce2433151c2ec6692456910a5a2adb54497abb8af0f9bf852a925a32bd71',
            },
          },
          'darwin' => {
            'x86_64' => {
              'checksum' => 'b5948a177230e128056459e080e2bc2d0b4708374417db11df64fd5ce857cf11',
            },
          },
        },
        '6.2.2' => {
          'release' => {
            'x86_64' => {
              'checksum' => '225b5c72e333c7e872f3d97f2ab4039e29a7a8bee02f0feb57744dbc59e67abe',
            },
          },
          'windows' => {
            'x86_64' => {
              'checksum' => '528f47cef675dee2ab3c1f5f065b4f1eecbee3bc1573e1b7e4bcf2133d4c64f2',
            },
          },
          'darwin' => {
            'x86_64' => {
              'checksum' => '0d3286ecde12b43f482f937597c927c3ba7db8be529d21573c2ddf58fb799e9a',
            },
          },
        },
        '6.2.1' => {
          'release' => {
            'x86_64' => {
              'checksum' => '1f13bb3f9e7197efaaec410ee1591f7ae07e1c7431e546c1c67dee8815f46aa9',
            },
          },
          'windows' => {
            'x86_64' => {
              'checksum' => '0628e1c74e7de35f31b00082ed280a39b9680d9206b5784adab428ca88c6b856',
            },
          },
          'darwin' => {
            'x86_64' => {
              'checksum' => '2bf6af0caee61492b39d2b7b61d90b84ef452d8bfebfff4fd0330aac79b00fc8',
            },
          },
        },
        '6.2.0' => {
          'release' => {
            'x86_64' => {
              'checksum' => '5c0b6033411e73e3934ee3a3d84c0815e41d78aaf916cf4c085d374a558a5c37',
            },
          },
          'windows' => {
            'x86_64' => {
              'checksum' => 'f4acfd02a1776a150ef1fe8663eb81123edb967f9446137a384b3a80612b0046',
            },
          },
          'darwin' => {
            'x86_64' => {
              'checksum' => 'd84525b73a3bbd6694d315253aa829bcd032821e30a8afebc532e630658fc4f7',
            },
          },
        },
        '6.1.4' => {
          'release' => {
            'x86_64' => {
              'checksum' => '0252773bf87ea23e98b39e006ad262f15c24320f1f0b420fe3484e2b388a0e54',
            },
          },
          'windows' => {
            'x86_64' => {
              'checksum' => '85f5d5ec818fe5c17048a39f47a0d7d470fcb769af372d02309743311a9509b6',
            },
          },
          'darwin' => {
            'x86_64' => {
              'checksum' => '500fa034040c9d7ebaf589ca3c147a98d514a37f30e8dba9970cda4be95ff66d',
            },
          },
        },
        '6.1.3' => {
          'release' => {
            'x86_64' => {
              'checksum' => '19caf0c29db6c98c8bf5194deba0de7ce065cc10bc2175af6f4efdbc3b88e2a7',
            },
          },
          'windows' => {
            'x86_64' => {
              'checksum' => '83f8bdbf03387336d5da00c2ba452daa5e62ba81822b4c0b213c0f5826ea4eb4',
            },
          },
          'darwin' => {
            'x86_64' => {
              'checksum' => '562b014016f404b4068d4632bbbbee4c247c809bced2bbabf1897fdafa86b8ce',
            },
          },
        },
        '6.1.2' => {
          'release' => {
            'x86_64' => {
              'checksum' => '5dba3de6e2a4dfc7cbf81ef93529a4457436207812314767acf97364a553fa4d',
            },
          },
          'windows' => {
            'x86_64' => {
              'checksum' => '9d0f862b9cb33ff3046d95df9c6d1e5b233f6f2ba58f81c3a7d0e41db1b91da6',
            },
          },
          'darwin' => {
            'x86_64' => {
              'checksum' => '0d76fabb2a4aa64fb9e4b8758cc1d3fd619c251cb40d78e60c256ce977c25344',
            },
          },
        },
        '6.1.1' => {
          'release' => {
            'x86_64' => {
              'checksum' => '86dc1d1b5ddb85063e08bfd9e863f876ed75267d6a629e7a63353a4d26758720',
            },
          },
          'windows' => {
            'x86_64' => {
              'checksum' => '8e481236a2916c90107eb2602da44cb3a11a8c798f894e0f94957bb9fc616d92',
            },
          },
          'darwin' => {
            'x86_64' => {
              'checksum' => '47d5a623cf428037cd235a53d25d21fe3ac5ffbfb3eb8ee9ff9f599343a2c70d',
            },
          },
        },
        '6.1.0' => {
          'release' => {
            'x86_64' => {
              'checksum' => '64e41cc58e34e0c067da70c94829ad9e31218b40bfbd35ca2a42460293949322',
            },
          },
          'windows' => {
            'x86_64' => {
              'checksum' => '3b204bf43667e1dc0ab17efdf706235ecf712544602b43b30e4061c2fc725fa4',
            },
          },
          'darwin' => {
            'x86_64' => {
              'checksum' => '307db29d62cbabd27308905562aeac66e7ba5e039c3697559154f1a403901fc7',
            },
          },
        },
        '6.0.1' => {
          'release' => {
            'x86_64' => {
              'checksum' => '3683af16f0cd5055f002614890309ab4d571312d0d99fc8a01e0026abfbb8199',
            },
          },
          'windows' => {
            'x86_64' => {
              'checksum' => '31768f046c47c8bd76f3a17f4d7ee44176f05b3e0d410c781758818db9aaa693',
            },
          },
          'darwin' => {
            'x86_64' => {
              'checksum' => 'f9169ea59dad3040bdb4b94f911c17c53e71eca48aedca3b593aec61f027e135',
            },
          },
        },
        '6.0.0' => {
          'release' => {
            'x86_64' => {
              'checksum' => '52c582846cd814639cd5888ff6ad20c81d7319a673784935bc579cdcfb04680f',
            },
          },
          'windows' => {
            'x86_64' => {
              'checksum' => '31b9a0f9c8942dd43752b1a9f69907b39e47a994e3dfca9f68d02f628b73f818',
            },
          },
          'darwin' => {
            'x86_64' => {
              'checksum' => '4df71e6f4144a60847b3b5bb064bfd4b39c2824908b35de44338e1c41b1db411',
            },
          },
        },
        '5.6.16' => {
          'release' => {
            'x86_64' => {
              'checksum' => '4abbb3a0876fcdf8be76366e0fe5348aaa3bac71c68ec1884c8b14eee121f943',
            },
            'x86' => {
              'checksum' => 'b63a80c45cd866141799640ffeaf18990fc66f40ec7977498c20701606246a2e',
            },
          },
          'windows' => {
            'x86' => {
              'checksum' => '7e05d4a579c9c085b07ecbb8b80d0b44b2de87efb9a6c51b14d14e9ea9e51579',
            },
          },
          'darwin' => {
            'x86_64' => {
              'checksum' => '9406f8fc55adef28673d99674942b18eb14ba02621774c155074e29cd0130c4b',
            },
          },
        },
        '5.6.15' => {
          'release' => {
            'x86_64' => {
              'checksum' => '5b6891dd6c865262c08956f49c310c0d729b60bfb85bc39564f961fa5344223c',
            },
            'x86' => {
              'checksum' => '9586cc909a105e89db52f7c5c60e50fb921c465a0e2a1275bc35a175897121ee',
            },
          },
          'windows' => {
            'x86' => {
              'checksum' => 'b2ed1097fa4f2c86442ec25647d2304ded6b62c20c82f863e3dbe97261d3bbfb',
            },
          },
          'darwin' => {
            'x86_64' => {
              'checksum' => '94af3109b88229b864738c6b449efc669a786e31922641cc24423a1be3dd38e6',
            },
          },
        },
        '5.6.14' => {
          'release' => {
            'x86_64' => {
              'checksum' => '71cdc8c7c223967de0ca492147f91d3fd093876f9bc5802ccdab2f76d5f23b1a',
            },
            'x86' => {
              'checksum' => '1dfb19333b0082a791e70d3b7a85cf6120f8a42b598c4a074f996e5888894bbb',
            },
          },
          'windows' => {
            'x86' => {
              'checksum' => '9a17fc932294568c233232471bb2891e2cb7fc27a252e13054cbb9a1253e2806',
            },
          },
          'darwin' => {
            'x86_64' => {
              'checksum' => '46b9b092170604addf462e3e5f85b40294efb489c187fa8ead032624993e0ab6',
            },
          },
        },
        '5.6.13' => {
          'release' => {
            'x86_64' => {
              'checksum' => '1294523f9be72517a68e4a1a8fe672059235b2cbd257aaff88750225da62c201',
            },
            'x86' => {
              'checksum' => '0ac212901139249e6c08645ddbcc8b2f084d180bbac3110f2223d188fdbbb61c',
            },
          },
          'windows' => {
            'x86' => {
              'checksum' => '2a851d002e4f3f6588f890006c92750421c7d1e2a28816a0becb9f957c8828da',
            },
          },
          'darwin' => {
            'x86_64' => {
              'checksum' => 'b08b75f4ebad7022d74bb14caae137b8c92d5e849e9e988fbbd76971b1ebcc43',
            },
          },
        },
        '5.6.12' => {
          'release' => {
            'x86_64' => {
              'checksum' => '45f59627c9f72c27406f51444500e744611279712a8aa7ab87549eb3cea10072',
            },
            'x86' => {
              'checksum' => '447f46867f2da294b6d540e71b47a34af57485543c02ddbceaf97b378345228a',
            },
          },
          'windows' => {
            'x86' => {
              'checksum' => '6241586223e9a82251c6caed3718a3a8285fc4eab1c2c61338053bcc50731e92',
            },
          },
          'darwin' => {
            'x86_64' => {
              'checksum' => 'ca3552381c82cf2468b2be2492d9763797152485e6b51827762103f82070a154',
            },
          },
        },
        '5.6.11' => {
          'release' => {
            'x86_64' => {
              'checksum' => 'c75d26c80510bfd9436fba4fc086121dc98cd1465401ed14336ae565e48e1638',
            },
            'x86' => {
              'checksum' => 'fbe6b901f39b79d67a8aafd8e8934d2088943c4a0b68a20deac7600a40f24376',
            },
          },
          'windows' => {
            'x86' => {
              'checksum' => '92ef41067adbbafdbdc4f5fb148c64fab9c971962bfb9191e37f444e32495b8a',
            },
          },
          'darwin' => {
            'x86_64' => {
              'checksum' => '4dd0f666460daa886fd4891896f561af0a449323270dff5eed5bf1ce8b2570d2',
            },
          },
        },
        '5.6.10' => {
          'release' => {
            'x86_64' => {
              'checksum' => '7e26c99face6599f2040b1509dd3473103f2683bed8317f073db94b374a316b9',
            },
            'x86' => {
              'checksum' => 'ac36b0394ec8307e4d08123eee66802653be555e912040f5ce68e563a1fd9ac4',
            },
          },
          'windows' => {
            'x86' => {
              'checksum' => '7a1529889d0816a0b9a9a1ec9f69664a3e5dcd8bcfe949b8f0587557650d46ee',
            },
          },
          'darwin' => {
            'x86_64' => {
              'checksum' => '810d08f06dbfe777511dac70e2ff2762e182d7fd05cfa3f11c34aeaf37544419',
            },
          },
        },
        '5.6.9' => {
          'release' => {
            'x86_64' => {
              'checksum' => '92ec07aa8ea0fe71a2dfd7969e3eca9e2e2bf198b8f44579667a56546591e4e5',
            },
            'x86' => {
              'checksum' => '1d9fc2bfc63764b0329236b71adbf436830b1af41e0c7985b67708a7537f5c93',
            },
          },
          'windows' => {
            'x86' => {
              'checksum' => '32d990fccfa86aff57ad7c665ef097682ff6e998a5054a237b004b1acb788f38',
            },
          },
          'darwin' => {
            'x86_64' => {
              'checksum' => '53504ae5134a352a6f020eddd07fa04af4fdb635653d6959ece4747b481e8182',
            },
          },
        },
        '5.6.8' => {
          'release' => {
            'x86_64' => {
              'checksum' => '2d8516bd9ffee561c31eba4f3b3488b190308fbd72813bf17713992046bc0f42',
            },
            'x86' => {
              'checksum' => '5bc64ceb2c94f0494dac94db954b478b83d7944a93423a9db783f62f9106f0e8',
            },
          },
          'windows' => {
            'x86' => {
              'checksum' => '70689bf053c5afa3f50edc23fb0ad11215663e72bc05ea6b1b3c64ae8fb6a425',
            },
          },
          'darwin' => {
            'x86_64' => {
              'checksum' => 'f94f6ea06bdba2199ca9f4173a98d547e198431133cc735123362eb2e0638b04',
            },
          },
        },
        '5.6.7' => {
          'release' => {
            'x86_64' => {
              'checksum' => 'fb3308fb432296e935ddf100ffdf7ad450470603df7f518a2d0b035483ec0a30',
            },
            'x86' => {
              'checksum' => '02cb8e0c7064247579617253ecfc27384fea4f3ecbba3e90c0cbc4f49a1ab4fe',
            },
          },
          'windows' => {
            'x86' => {
              'checksum' => 'd4056c384f476005d3811aa57b4f4493d0df475939eb963fc7a94abc21079a3b',
            },
          },
          'darwin' => {
            'x86_64' => {
              'checksum' => 'b9bb3fb9d166f157f69ea87cf9d9b9935badb0ca0cafc46b17c3ed1669c9eec9',
            },
          },
        },
        '5.6.2' => {
          'release' => {
            'x86_64' => {
              'checksum' => 'd4fb6a736c367d8df563f405bdc3c6d6541e1a8fe0b22d29c8070c032ca97cd8',
            },
            'x86' => {
              'checksum' => 'de69314c6616ca9e467b67c9b3800ca1c1cc843a8709a4cb435ba017a3affcc8',
            },
          },
          'windows' => {
            'x86' => {
              'checksum' => 'c0b6ad3fdae1de6536ed3478b400013a92942e45b4c24f089d9aa678dbce23f9',
            },
          },
          'darwin' => {
            'x86_64' => {
              'checksum' => 'ff8ec244f552c3f087c5026d6ceb6d14f3e67a6b2bfeebabebef8b6edb8ffc4b',
            },
          },
        },
        '5.5.2' => {
          'release' => {
            'x86_64' => {
              'checksum' => '4b879a36899d886c1264c6c2e0c662d56ebefee703fa4c62bca793124d3ebd5a',
            },
            'x86' => {
              'checksum' => 'f74e16d73da0b31e8c04276b13f755c49f95e59209079adbefff40cd56e5a62a',
            },
          },
          'windows' => {
            'x86' => {
              'checksum' => '9b3014d095543566b6cbff8de7013889ba7e3e49ac8365b7310f51843a9036a6',
            },
          },
          'darwin' => {
            'x86_64' => {
              'checksum' => 'f4ee5bd790aa9d2a7e6747a193c1ba5e7d6ce70c59bb2787624e44f2f5a7564e',
            },
          },
        },
        '5.4.1' => {
          'release' => {
            'x86_64' => {
              'checksum' => 'efab73464c6cbc90089acf9275e43c7b3c2bbe8fb62c710567ac523a65c3394b',
            },
            'x86' => {
              'checksum' => '25b309435ae4760332e2072e80a83848852245f5c91af6f72bf09771a0bd73fa',
            },
          },
          'windows' => {
            'x86' => {
              'checksum' => 'bf88a207b5d4be62c02b83cf2d1cce14aac1a48a9feb084817b93e4690b00983',
            },
          },
          'darwin' => {
            'x86_64' => {
              'checksum' => 'ea66827790ed6dbce241ccdee37e25f3da6ea01c0b1ca5a018032cef626c6239',
            },
          },
        },
        '5.4.0' => {
          'release' => {
            'x86_64' => {
              'checksum' => '58838dcb5b3195455e1eb05926fed27d882a3476370facfc35d39d837940b1bc',
            },
            'x86' => {
              'checksum' => 'fbeda3f125cd95cc914c1eb49f65313eb55ce65c9300f231f2d050f4c6bbb65f',
            },
          },
          'windows' => {
            'x64' => {
              'checksum' => '9c3c36c042962794b1eb9f45a585302f3eb4c01aecca7c06fb53097b7e7d2852',
            },
          },
        },
        '5.3.0' => {
          'release' => {
            'x86_64' => {
              'checksum' => 'f31369c32d655370f0e51290018004cfbc54e2d648f0f79dba88e36b4d6cce6f',
            },
            'x86' => {
              'checksum' => 'eddc77334032ed30f98289715781d01e7677d598cf4a3ad5595618cc057a8bfc',
            },
          },
          'windows' => {
            'x64' => {
              'checksum' => '56c5fbd5767dea313ab11489cfed6da063677f9ad38fe9c0420535a46bfdbdaf',
            },
          },
        },
        '5.2.2' => {
          'release' => {
            'x86_64' => {
              'checksum' => '9c7c526ce286da7f63aed9fb9f9d752ec182ff16bf374c55e55e5a0536a33563',
            },
            'x86' => {
              'checksum' => 'de0421728aca00e9d4114b45ad5519b843b700006eb0795fcc2df4371d6baa1d',
            },
          },
          'windows' => {
            'x64' => {
              'checksum' => '8d6435aa6cfef1a8ce8d4a84361139d0ea3848abfe87283765b4da4fbaefdd3f',
            },
          },
        },
        '5.2.1' => {
          'release' => {
            'x86_64' => {
              'checksum' => '82f06fc998385f08eac1c26bb0a48b29a34d179fdb7d0e8be216b35782f12bff',
            },
            'x86' => {
              'checksum' => 'c3f27b73e29a9b51a89b9b58798a0ea087df29978424255acb441a8b3e3540bf',
            },
          },
          'windows' => {
            'x64' => {
              'checksum' => '8753db954a89a7a5c19a2c93886b523d1f8054bd31ce24c772bd873555a949d8',
            },
          },
        },
        '5.2.0' => {
          'release' => {
            'x86_64' => {
              'checksum' => '729af8ab00f719f2038f6c499e508744b274487756e0214b660535ebead6f28a',
            },
            'x86' => {
              'checksum' => '9df75d2dc05937064f1ec905edc705ab1a83e8aaddef6b2fa90b2826f6cc2ea4',
            },
          },
          'windows' => {
            'x64' => {
              'checksum' => 'bd1be9758b11b071bc033e9ed996598f4da6cdb18b28c475993c429f1c17db31',
            },
          },
        },
      }
    end
  end
end

::Chef::Recipe.send(:include, Kibana::Helpers)
::Chef::Resource.send(:include, Kibana::Helpers)
::Chef::Provider.send(:include, Kibana::Helpers)
