Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [78.108.216.32])
	by mail.lfdr.de (Postfix) with ESMTPS id 23D47393DD7
	for <lists+drbd-dev@lfdr.de>; Fri, 28 May 2021 09:27:22 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id DB14F4205FA;
	Fri, 28 May 2021 09:27:21 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
X-Greylist: delayed 583 seconds by postgrey-1.31 at mail19;
	Fri, 28 May 2021 03:32:38 CEST
Received: from mail-m2835.qiye.163.com (mail-m2835.qiye.163.com [103.74.28.35])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 779AE4205C4
	for <drbd-dev@lists.linbit.com>; Fri, 28 May 2021 03:32:37 +0200 (CEST)
Received: from localhost.localdomain (unknown [218.94.118.90])
	by mail-m2835.qiye.163.com (Hmail) with ESMTPA id 127E17800A8;
	Fri, 28 May 2021 09:22:52 +0800 (CST)
From: Chen Fan <fan.chen@easystack.cn>
To: drbd-dev@lists.linbit.com
Date: Fri, 28 May 2021 09:22:44 +0800
Message-Id: <20210528012244.46041-1-fan.chen@easystack.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgYFAkeWUFZS1VLWVdZKFlBSUI3V1ktWUFJV1kPCR
	oVCBIfWUFZGhoYTVYfQ0hJSxkYGEJLH09VGRETFhoSFyQUDg9ZV1kWGg8SFR0UWUFZT0tIVUpKS0
	hKQ1VLWQY+
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6OBQ6Sgw4TD02GT0WHggsCRIO
	IUgwCy9VSlVKTUlJSk1PQkxJT0xKVTMWGhIXVR0aFVUYEx4VOx4aCAIIDxoYEFUYFUVZV1kSC1lB
	WUlKQ1VCT1VKSkNVQktZV1kIAVlBSEpPTDcG
X-HM-Tid: 0a79b0912296841dkuqw127e17800a8
X-Mailman-Approved-At: Fri, 28 May 2021 09:27:21 +0200
Cc: "lingang . zeng" <linggang.zeng@easystack.cn>
Subject: [Drbd-dev] [PATCH 1/1] Fix the wrong maxinum of ping timeout in
	documentation
X-BeenThere: drbd-dev@lists.linbit.com
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: "*Coordination* of development, patches,
	contributions -- *Questions* \(even to developers\) go to drbd-user,
	please." <drbd-dev.lists.linbit.com>
List-Unsubscribe: <https://lists.linbit.com/mailman/options/drbd-dev>,
	<mailto:drbd-dev-request@lists.linbit.com?subject=unsubscribe>
List-Archive: <http://lists.linbit.com/pipermail/drbd-dev>
List-Post: <mailto:drbd-dev@lists.linbit.com>
List-Help: <mailto:drbd-dev-request@lists.linbit.com?subject=help>
List-Subscribe: <https://lists.linbit.com/mailman/listinfo/drbd-dev>,
	<mailto:drbd-dev-request@lists.linbit.com?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: drbd-dev-bounces@lists.linbit.com
Errors-To: drbd-dev-bounces@lists.linbit.com

U2lnbmVkLW9mZi1ieTogQ2hlbiBGYW4gPGZhbi5jaGVuQGVhc3lzdGFjay5jbj4KUmVwb3J0ZWQt
Ynk6IGxpbmdhbmcuemVuZyA8bGluZ2dhbmcuemVuZ0BlYXN5c3RhY2suY24+Ci0tLQogZG9jdW1l
bnRhdGlvbi9qYS92OS9kcmJkc2V0dXAtb3B0aW9ucy54bWwucG8gfCA0ICsrLS0KIGRvY3VtZW50
YXRpb24vdjkvZHJiZHNldHVwLW9wdGlvbnMueG1sICAgICAgIHwgMiArLQogMiBmaWxlcyBjaGFu
Z2VkLCAzIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZG9jdW1l
bnRhdGlvbi9qYS92OS9kcmJkc2V0dXAtb3B0aW9ucy54bWwucG8gYi9kb2N1bWVudGF0aW9uL2ph
L3Y5L2RyYmRzZXR1cC1vcHRpb25zLnhtbC5wbwppbmRleCA2MDEwOTEzZS4uYzRhYWNmZmYgMTAw
NjQ0Ci0tLSBhL2RvY3VtZW50YXRpb24vamEvdjkvZHJiZHNldHVwLW9wdGlvbnMueG1sLnBvCisr
KyBiL2RvY3VtZW50YXRpb24vamEvdjkvZHJiZHNldHVwLW9wdGlvbnMueG1sLnBvCkBAIC0xNjMy
LDEzICsxNjMyLDEzIEBAIG1zZ2lkICIiCiAiPHBsYWNlaG9sZGVyIHR5cGU9XCJpbmRleHRlcm1c
IiBpZD1cIjBcIi8+IERlZmluZSB0aGUgdGltZW91dCBmb3IgcmVwbGllcyB0byAiCiAia2VlcC1h
bGl2ZSBwYWNrZXRzLiAgSWYgdGhlIHBlZXIgZG9lcyBub3QgcmVwbHkgd2l0aGluIDxvcHRpb24+
cGluZy10aW1lb3V0PC8iCiAib3B0aW9uPiwgRFJCRCB3aWxsIGNsb3NlIGFuZCB0cnkgdG8gcmVl
c3RhYmxpc2ggdGhlIGNvbm5lY3Rpb24uICBUaGUgZGVmYXVsdCAiCi0idmFsdWUgaXMgMC41IHNl
Y29uZHMsIHdpdGggYSBtaW5pbXVtIG9mIDAuMSBzZWNvbmRzIGFuZCBhIG1heGltdW0gb2YgMyAi
CisidmFsdWUgaXMgMC41IHNlY29uZHMsIHdpdGggYSBtaW5pbXVtIG9mIDAuMSBzZWNvbmRzIGFu
ZCBhIG1heGltdW0gb2YgMzAgIgogInNlY29uZHMuICBUaGUgdW5pdCBpcyB0ZW50aHMgb2YgYSBz
ZWNvbmQuIgogbXNnc3RyICIiCiAiPHBsYWNlaG9sZGVyIHR5cGU9XCJpbmRleHRlcm1cIiBpZD1c
IjBcIi8+44Kt44O844OX44Ki44Op44Kk44OW44OR44Kx44OD44OI44G444Gu5b+c562U44Gu44K/
IgogIuOCpOODoOOCouOCpuODiOOCkuWumue+qeOBmeOCi+OAguWvvuWQkeODjuODvOODieOBjCA8
b3B0aW9uPnBpbmctdGltZW91dDwvb3B0aW9uPiDplpPjgaflv5znrZTjgZfjgaoiCiAi44GE5aC0
5ZCI44CBIERSQkQg44Gv5o6l57aa44KS57WC5LqG44GX44CB5YaN5o6l57aa44GX44KI44GG44Go
44GZ44KL44CC44OH44OV44Kp44Or44OI5YCk44GvIDAuNSDnp5LjgafjgIHmnIAiCi0i5bCP5YCk
44GvIDAuMSDnp5LjgIHmnIDlpKflgKTjga8gMyDnp5LjgafjgYLjgovjgILljZjkvY3jga8gMTAg
5YiG44GuIDEg56eS44Gn44GC44KL44CCIgorIuWwj+WApOOBryAwLjEg56eS44CB5pyA5aSn5YCk
44GvIDMwIOenkuOBp+OBguOCi+OAguWNmOS9jeOBryAxMCDliIbjga4gMSDnp5LjgafjgYLjgovj
gIIiCiAKICMuIHR5cGU6IENvbnRlbnQgb2Y6IDxkcmJkc2V0dXBfb3B0aW9ucz48ZHJiZHNldHVw
X29wdGlvbj48dGVybT4KIG1zZ2lkICIiCmRpZmYgLS1naXQgYS9kb2N1bWVudGF0aW9uL3Y5L2Ry
YmRzZXR1cC1vcHRpb25zLnhtbCBiL2RvY3VtZW50YXRpb24vdjkvZHJiZHNldHVwLW9wdGlvbnMu
eG1sCmluZGV4IDViNWU1OGQ3Li5hODk5MDcwNyAxMDA2NDQKLS0tIGEvZG9jdW1lbnRhdGlvbi92
OS9kcmJkc2V0dXAtb3B0aW9ucy54bWwKKysrIGIvZG9jdW1lbnRhdGlvbi92OS9kcmJkc2V0dXAt
b3B0aW9ucy54bWwKQEAgLTExNjEsNyArMTE2MSw3IEBAIFNZTUxJTktfQllfRElTSz1kcmJkL2J5
LWRpc2svPGJhY2tpbmctZGlzay1uYW1lPgogCTwvaW5kZXh0ZXJtPiBEZWZpbmUgdGhlIHRpbWVv
dXQgZm9yIHJlcGxpZXMgdG8ga2VlcC1hbGl2ZSBwYWNrZXRzLiAgSWYKIAl0aGUgcGVlciBkb2Vz
IG5vdCByZXBseSB3aXRoaW4gPG9wdGlvbj5waW5nLXRpbWVvdXQ8L29wdGlvbj4sIERSQkQgd2ls
bAogCWNsb3NlIGFuZCB0cnkgdG8gcmVlc3RhYmxpc2ggdGhlIGNvbm5lY3Rpb24uICBUaGUgZGVm
YXVsdCB2YWx1ZSBpcyAwLjUKLQlzZWNvbmRzLCB3aXRoIGEgbWluaW11bSBvZiAwLjEgc2Vjb25k
cyBhbmQgYSBtYXhpbXVtIG9mIDMgc2Vjb25kcy4gIFRoZQorCXNlY29uZHMsIHdpdGggYSBtaW5p
bXVtIG9mIDAuMSBzZWNvbmRzIGFuZCBhIG1heGltdW0gb2YgMzAgc2Vjb25kcy4gIFRoZQogCXVu
aXQgaXMgdGVudGhzIG9mIGEgc2Vjb25kLjwvcGFyYT4KICAgICA8L2RlZmluaXRpb24+CiAgIDwv
ZHJiZHNldHVwX29wdGlvbj4KLS0gCjIuMjUuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJiZC1kZXYgbWFpbGluZyBsaXN0CmRyYmQtZGV2QGxpc3Rz
LmxpbmJpdC5jb20KaHR0cHM6Ly9saXN0cy5saW5iaXQuY29tL21haWxtYW4vbGlzdGluZm8vZHJi
ZC1kZXYK
