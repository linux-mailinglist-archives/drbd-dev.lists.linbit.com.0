Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id E177F50F36C
	for <lists+drbd-dev@lfdr.de>; Tue, 26 Apr 2022 10:10:13 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id C94084203B5;
	Tue, 26 Apr 2022 10:10:12 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-m2837.qiye.163.com (mail-m2837.qiye.163.com [103.74.28.37])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id B1F0D4201DC
	for <drbd-dev@lists.linbit.com>; Tue, 26 Apr 2022 10:09:08 +0200 (CEST)
Received: from localhost.localdomain (unknown [218.94.118.90])
	by mail-m2837.qiye.163.com (Hmail) with ESMTPA id 11A53600C65;
	Tue, 26 Apr 2022 16:09:04 +0800 (CST)
From: Rui Xu <rui.xu@easystack.cn>
To: philipp.reisner@linbit.com, drbd-dev@lists.linbit.com,
	joel.colledge@linbit.com
Date: Tue, 26 Apr 2022 16:09:03 +0800
Message-Id: <20220426080903.1831211-1-rui.xu@easystack.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgPGg8OCBgUHx5ZQUlOS1dZCBgUCR5ZQVlLVUtZV1
	kWDxoPAgseWUFZKDYvK1lXWShZQUlCN1dZLVlBSVdZDwkaFQgSH1lBWRlIHRhWQktIQk1NGkIdSk
	gYVRkRExYaEhckFA4PWVdZFhoPEhUdFFlBWU9LSFVKSktISkxVS1kG
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6Pzo6Qio*SjItTBNDNw4RLy8J
	PgsaCTBVSlVKTU5LQk1LTk9NSUhMVTMWGhIXVQkOElUDDjseGggCCA8aGBBVGBVFWVdZEgtZQVlJ
	SkNVQk9VSkpDVUJLWVdZCAFZQUlITUg3Bg++
X-HM-Tid: 0a8064eab72f841fkuqw11a53600c65
Cc: Rui Xu <rui.xu@easystack.cn>, dongsheng.yang@easystack.cn
Subject: [Drbd-dev] [PATCH v2] drbd: fix a race of drbd_free_peer_req
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
YWluICAgICAgICAgICAgICAgICAgZHJiZF9mcmVlX3BlZXJfcmVxCnNwaW5fbG9jaygpCnBhZ2Vf
Y2hhaW5fYWRkCnNwaW5fdW5sb2NrKCkgICAgICAgICAgICAgICAgICAgICAgICAgc3Bpbl9sb2Nr
KCkKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwYWdlX2NoYWluX2FkZAog
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHNwaW5fdW5sb2NrKCkKCldlIGNh
biBzZWUgdGhhdCBwYWdlX2NoYWluX2FkZCB3aWxsIGJlIGNhbGxlZCB0d2ljZSB3aGljaCB3aWxs
IGxlYWQKdG8gY3Jhc2guCgpTd2FwIGRyYmRfbWF5X2ZpbmlzaF9lcG9jaCgpIGFuZCBkcmJkX2Zy
ZWVfcGFnZV9jaGFpbigpIGluIGVfZW5kX2Jsb2NrKCkKdG8gZW5zdXJlIHRoYXQgZ290X3BlZXJf
YWNrIHdpbGwgbm90IGJlIGNhbGxlZCB3aGlsZSBzdGlsbCBwcm9jZXNzaW5nCnRoZSByZXF1ZXN0
IGluIGRyYmRfZmluaXNoX3BlZXJfcmVxcygpLgoKU2lnbmVkLW9mZi1ieTogUnVpIFh1IDxydWku
eHVAZWFzeXN0YWNrLmNuPgotLS0KIGRyYmQvZHJiZF9yZWNlaXZlci5jIHwgMyArKy0KIDEgZmls
ZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9k
cmJkL2RyYmRfcmVjZWl2ZXIuYyBiL2RyYmQvZHJiZF9yZWNlaXZlci5jCmluZGV4IGYwNzdmMmIu
LmQwZjQyZDMgMTAwNjQ0Ci0tLSBhL2RyYmQvZHJiZF9yZWNlaXZlci5jCisrKyBiL2RyYmQvZHJi
ZF9yZWNlaXZlci5jCkBAIC0yNTYwLDkgKzI1NjAsMTAgQEAgc3RhdGljIGludCBlX2VuZF9ibG9j
ayhzdHJ1Y3QgZHJiZF93b3JrICp3LCBpbnQgY2FuY2VsKQogCX0gZWxzZQogCQlEX0FTU0VSVChk
ZXZpY2UsIGRyYmRfaW50ZXJ2YWxfZW1wdHkoJnBlZXJfcmVxLT5pKSk7CiAKKwlkcmJkX2ZyZWVf
cGFnZV9jaGFpbigmcGVlcl9kZXZpY2UtPmNvbm5lY3Rpb24tPnRyYW5zcG9ydCwgJnBlZXJfcmVx
LT5wYWdlX2NoYWluLCAwKTsKKwogCWRyYmRfbWF5X2ZpbmlzaF9lcG9jaChwZWVyX2RldmljZS0+
Y29ubmVjdGlvbiwgcGVlcl9yZXEtPmVwb2NoLCBFVl9QVVQgKyAoY2FuY2VsID8gRVZfQ0xFQU5V
UCA6IDApKTsKIAotCWRyYmRfZnJlZV9wYWdlX2NoYWluKCZwZWVyX2RldmljZS0+Y29ubmVjdGlv
bi0+dHJhbnNwb3J0LCAmcGVlcl9yZXEtPnBhZ2VfY2hhaW4sIDApOwogCXJldHVybiBlcnI7CiB9
CiAKLS0gCjEuOC4zLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmRyYmQtZGV2IG1haWxpbmcgbGlzdApkcmJkLWRldkBsaXN0cy5saW5iaXQuY29tCmh0
dHBzOi8vbGlzdHMubGluYml0LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2RyYmQtZGV2Cg==
