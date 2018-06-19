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
      (node['kernel']['machine'] == 'x86_64') ? 'x86_64' : 'x86'
    end

    # Returns SHA256 checksum map for Kibana artifacts
    def kibana_checksum_map
      {
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
