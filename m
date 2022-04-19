Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BFAD506C6B
	for <lists+drbd-dev@lfdr.de>; Tue, 19 Apr 2022 14:26:49 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 07D434202D2;
	Tue, 19 Apr 2022 14:26:48 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
X-Greylist: delayed 594 seconds by postgrey-1.31 at mail19;
	Tue, 19 Apr 2022 14:26:47 CEST
Received: from mail-m2837.qiye.163.com (mail-m2837.qiye.163.com [103.74.28.37])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 02C54420193
	for <drbd-dev@lists.linbit.com>; Tue, 19 Apr 2022 14:26:46 +0200 (CEST)
Received: from localhost.localdomain (unknown [218.94.118.90])
	by mail-m2837.qiye.163.com (Hmail) with ESMTPA id 2E1F360021B;
	Tue, 19 Apr 2022 20:16:49 +0800 (CST)
From: Rui Xu <rui.xu@easystack.cn>
To: philipp.reisner@linbit.com, drbd-dev@lists.linbit.com,
	joel.colledge@linbit.com
Date: Tue, 19 Apr 2022 20:16:47 +0800
Message-Id: <20220419121647.638794-1-rui.xu@easystack.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgPGg8OCBgUHx5ZQUlOS1dZCBgUCR5ZQVlLVUtZV1
	kWDxoPAgseWUFZKDYvK1lXWShZQUlCN1dZLVlBSVdZDwkaFQgSH1lBWUMYTR5WHklNSkkdT0hOGE
	1CVRkRExYaEhckFA4PWVdZFhoPEhUdFFlBWU9LSFVKSktISkxVS1kG
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6NS46Cxw*KzIsIRpKCjBJMgwy
	FE8KFANVSlVKTU5LSExLTUpLS0lOVTMWGhIXVQkOElUDDjseGggCCA8aGBBVGBVFWVdZEgtZQVlJ
	SkNVQk9VSkpDVUJLWVdZCAFZQUlNQkw3Bg++
X-HM-Tid: 0a8041c10216841fkuqw2e1f360021b
Cc: Rui Xu <rui.xu@easystack.cn>, dongsheng.yang@easystack.cn
Subject: [Drbd-dev] [PATCH] drbd: fix a race of drbd_free_peer_req
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

Q29tbWl0IGUwNjFmZWI4IGFuZCA5YTExZWJlYjUgaW50cm9kdWNlIGEgYnVnIHRvIHJhY2Ugd2l0
aCBkcmJkX2ZyZWVfcGVlcl9yZXEoKQppbiBnb3RfcGVlcl9hY2suCgpkcmJkX2ZyZWVfcGFnZV9j
aGFpbiBpbiBkcmJkX2ZpbmlzaF9wZWVyX3JlcXMgYW5kIGdvdF9wZWVyX2FjayBtYXkgaGFwcGVu
CmNvbmN1cnJlbnRsee+8jCB0aGUgc2VxdWVuY2UgaXMgYXMgZm9sbG93czoKCmRyYmRfZmluaXNo
X3BlZXJfcmVxcyAgICAgICAgICAgICAgICAgZ290X3BlZXJfYWNrCmRyYmRfZnJlZV9wYWdlX2No
YWluCQkgICAgICBkcmJkX2ZyZWVfcGVlcl9yZXEKc3Bpbl9sb2NrKCkKcGFnZV9jaGFpbl9hZGQK
c3Bpbl91bmxvY2soKSAgICAgICAgICAgICAgICAgICAgICAgICBzcGluX2xvY2soKQoJCQkJICAg
ICAgcGFnZV9jaGFpbl9hZGQKCQkJCSAgICAgIHNwaW5fdW5sb2NrKCkKV2UgY2FuIHNlZSB0aGF0
IHBhZ2VfY2hhaW5fYWRkIHdpbGwgYmUgY2FsbGVkIHR3aWNlIHdoaWNoIHdpbGwgbGVhZAp0byBj
cmFzaC4KClJldmVydCB0aG9zZSB0d28gY29tbWl0cyB0byBlbnN1cmUgdGhhdCBkcmJkX2ZyZWVf
cGFnZV9jaGFpbiB3aWxsIG9ubHkKY2FsbGVkIG9uY2UgZm9yIG9uZSBwZWVyX3JlcS4KClNpZ25l
ZC1vZmYtYnk6IFJ1aSBYdSA8cnVpLnh1QGVhc3lzdGFjay5jbj4KLS0tCiBkcmJkL2RyYmRfcmVj
ZWl2ZXIuYyB8IDYgKysrLS0tCiAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAzIGRl
bGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyYmQvZHJiZF9yZWNlaXZlci5jIGIvZHJiZC9kcmJk
X3JlY2VpdmVyLmMKaW5kZXggZjA3N2YyYi4uOGNhYzg5YiAxMDA2NDQKLS0tIGEvZHJiZC9kcmJk
X3JlY2VpdmVyLmMKKysrIGIvZHJiZC9kcmJkX3JlY2VpdmVyLmMKQEAgLTY1MywxMCArNjUzLDEy
IEBAIHN0YXRpYyBpbnQgZHJiZF9maW5pc2hfcGVlcl9yZXFzKHN0cnVjdCBkcmJkX2Nvbm5lY3Rp
b24gKmNvbm5lY3Rpb24pCiAKIAkJKytuOwogCQkvKiBsaXN0X2RlbCBub3QgbmVjZXNzYXJ5LCBu
ZXh0L3ByZXYgbWVtYmVycyBub3QgdG91Y2hlZCAqLwotCQkvKiBUaGUgY2FsbGJhY2sgbWF5IGZy
ZWUgcGVlcl9yZXEuICovCiAJCWVycjIgPSBwZWVyX3JlcS0+dy5jYigmcGVlcl9yZXEtPncsICEh
ZXJyKTsKIAkJaWYgKCFlcnIpCiAJCQllcnIgPSBlcnIyOworCQorCQlpZiAobGlzdF9lbXB0eSgm
cGVlcl9yZXEtPnJlY3Zfb3JkZXIpKSB7CisJCQlkcmJkX2ZyZWVfcGVlcl9yZXEocGVlcl9yZXEp
OwogCX0KIAlpZiAoYXRvbWljX3N1Yl9hbmRfdGVzdChuLCAmY29ubmVjdGlvbi0+ZG9uZV9lZV9j
bnQpKQogCQl3YWtlX3VwKCZjb25uZWN0aW9uLT5lZV93YWl0KTsKQEAgLTIyOTMsNyArMjI5NSw2
IEBAIHN0YXRpYyBpbnQgZV9lbmRfcmVzeW5jX2Jsb2NrKHN0cnVjdCBkcmJkX3dvcmsgKncsIGlu
dCB1bnVzZWQpCiAJfQogCWRlY191bmFja2VkKHBlZXJfZGV2aWNlKTsKIAotCWRyYmRfZnJlZV9w
ZWVyX3JlcShwZWVyX3JlcSk7CiAJcmV0dXJuIGVycjsKIH0KIApAQCAtMjU2Miw3ICsyNTYzLDYg
QEAgc3RhdGljIGludCBlX2VuZF9ibG9jayhzdHJ1Y3QgZHJiZF93b3JrICp3LCBpbnQgY2FuY2Vs
KQogCiAJZHJiZF9tYXlfZmluaXNoX2Vwb2NoKHBlZXJfZGV2aWNlLT5jb25uZWN0aW9uLCBwZWVy
X3JlcS0+ZXBvY2gsIEVWX1BVVCArIChjYW5jZWwgPyBFVl9DTEVBTlVQIDogMCkpOwogCi0JZHJi
ZF9mcmVlX3BhZ2VfY2hhaW4oJnBlZXJfZGV2aWNlLT5jb25uZWN0aW9uLT50cmFuc3BvcnQsICZw
ZWVyX3JlcS0+cGFnZV9jaGFpbiwgMCk7CiAJcmV0dXJuIGVycjsKIH0KIAotLSAKMS44LjMuMQoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJiZC1kZXYg
bWFpbGluZyBsaXN0CmRyYmQtZGV2QGxpc3RzLmxpbmJpdC5jb20KaHR0cHM6Ly9saXN0cy5saW5i
aXQuY29tL21haWxtYW4vbGlzdGluZm8vZHJiZC1kZXYK
