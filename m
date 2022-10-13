Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 1896B5FDBA8
	for <lists+drbd-dev@lfdr.de>; Thu, 13 Oct 2022 15:53:58 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 01176420963;
	Thu, 13 Oct 2022 15:53:58 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
	[209.85.221.45])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id A7A7E4202D0
	for <drbd-dev@lists.linbit.com>; Thu, 13 Oct 2022 15:53:56 +0200 (CEST)
Received: by mail-wr1-f45.google.com with SMTP id n12so2929435wrp.10
	for <drbd-dev@lists.linbit.com>; Thu, 13 Oct 2022 06:53:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linbit-com.20210112.gappssmtp.com; s=20210112;
	h=content-transfer-encoding:mime-version:message-id:date:subject:cc
	:to:from:from:to:cc:subject:date:message-id:reply-to;
	bh=7OuLUBYXAOcE8pcq9/e9z3dyHvBPYPaNaSxybWb4IeQ=;
	b=z5vPZmNilmP1yjz6rliV0fXjnjfKafx+zYGelFWnyz7OXmhxjlK2moya1FjN+W1fdp
	cAvV4v8NvLGkiUcLkPLUz+ANQ8PxeUGItIgtAeA+LpepSOoE2Joi1Q+CV6QoyiatLeKM
	dEesH8tJPD0lDG6oA2D+II6e9O2zamTOWVimdfghrhw7I9xSFLdpcOwqqtYa5z2ogyAJ
	FlSYzFktdHugGNdw+jIa1MS3JSaVjH65dx4VnPew8VLF48g+CA8MxtTEcrwHlqwEN1lj
	PleWrPMTIqEIypdb0cEzWYqUKK6CBl/8XkiE8P0ENW7nU4qoyhrMn9Y+vuRATB+o2DC2
	C3YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=content-transfer-encoding:mime-version:message-id:date:subject:cc
	:to:from:x-gm-message-state:from:to:cc:subject:date:message-id
	:reply-to;
	bh=7OuLUBYXAOcE8pcq9/e9z3dyHvBPYPaNaSxybWb4IeQ=;
	b=RkdmH1fyPU5SZFwh30JK8h+7C/CkCpM9EErQdGiKE/3GdTlfsCVDK8vp0YcrF4YG/q
	66g00+RW5+jHTexXP85KS+jEO/VjcNQu8Pm0NtUHs8nmzGxkt2oYmXHwr6IZyMxt4E6c
	0Ih8CKGLabaZbfyx0cehQx1iyiRtNaD8kxp3e0yosq9LKoowQ1scMrC6Y1F+prHrZkU3
	U/54F/afxwGN59wGbRFdWSRyHfu6W1bbvxmWwynod+4jsIwzsOzRpsHUhmrr5r1rbiad
	78rfffVf59cryQ5KLk+wBrg4Re9WQz+6Vt3tUXI+JgJNtVJ+QmRVzSoPZCxeFlXhGkzK
	X9vg==
X-Gm-Message-State: ACrzQf2ehp19T+SUrjfE3X09d8ON/YvUTmFrgrmXAdfLuay5y5t4uzCU
	XxlQbD71Aa9CuBXMIvaq4XNuG7fN
X-Google-Smtp-Source: AMsMyM5hfn1dZeeqQqGVcZG4ukNtnCmoJ5ApnsgQva1teAak+8QSCMhsooZni9Qx85RwueqDDL4gYg==
X-Received: by 2002:adf:e19e:0:b0:22e:64de:39fa with SMTP id
	az30-20020adfe19e000000b0022e64de39famr39211wrb.369.1665669236071;
	Thu, 13 Oct 2022 06:53:56 -0700 (PDT)
Received: from localhost.localdomain (089144213149.atnat0022.highway.a1.net.
	[89.144.213.149]) by smtp.gmail.com with ESMTPSA id
	y8-20020a05600c364800b003c6bd91caa5sm4441295wmq.17.2022.10.13.06.53.54
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 13 Oct 2022 06:53:55 -0700 (PDT)
From: =?UTF-8?q?Christoph=20B=C3=B6hmwalder?=
	<christoph.boehmwalder@linbit.com>
To: Jens Axboe <axboe@kernel.dk>
Date: Thu, 13 Oct 2022 15:53:52 +0200
Message-Id: <20221013135352.933875-1-christoph.boehmwalder@linbit.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Cc: linux-kernel@vger.kernel.org, Philipp Reisner <philipp.reisner@linbit.com>,
	linux-block@vger.kernel.org, Christoph Hellwig <hch@lst.de>,
	drbd-dev@lists.linbit.com
Subject: [Drbd-dev] [PATCH] drbd: only clone bio if we have a backing device
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

Q29tbWl0IGMzNDdhNzg3ZTM0Y2IgKGRyYmQ6IHNldCAtPmJpX2JkZXYgaW4gZHJiZF9yZXFfbmV3
KSBtb3ZlZCBhCmJpb19zZXRfZGV2IGNhbGwgKHdoaWNoIGhhcyBzaW5jZSBiZWVuIHJlbW92ZWQp
IHRvICJlYXJsaWVyIiwgZnJvbQpkcmJkX3JlcXVlc3RfcHJlcGFyZSB0byBkcmJkX3JlcV9uZXcu
CgpUaGUgcHJvYmxlbSBpcyB0aGF0IHRoaXMgYWNjZXNzZXMgZGV2aWNlLT5sZGV2LT5iYWNraW5n
X2JkZXYsIHdoaWNoIGlzCm5vdCBOVUxMLWNoZWNrZWQgYXQgdGhpcyBwb2ludC4gV2hlbiB3ZSBk
b24ndCBoYXZlIGFuIGxkZXYgKGkuZS4gd2hlbgp0aGUgRFJCRCBkZXZpY2UgaXMgZGlza2xlc3Mp
LCB0aGlzIGxlYWRzIHRvIGEgbnVsbCBwb2ludGVyIGRlcmVmLgoKU28sIG9ubHkgYWxsb2NhdGUg
dGhlIHByaXZhdGVfYmlvIGlmIHdlIGFjdHVhbGx5IGhhdmUgYSBkaXNrLiBUaGlzIGlzCmFsc28g
YSBzbWFsbCBvcHRpbWl6YXRpb24sIHNpbmNlIHdlIGRvbid0IGNsb25lIHRoZSBiaW8gdG8gb25s
eSB0bwppbW1lZGlhdGVseSBmcmVlIGl0IGFnYWluIGluIHRoZSBkaXNrbGVzcyBjYXNlLgoKRml4
ZXM6IGMzNDdhNzg3ZTM0Y2IgKCJkcmJkOiBzZXQgLT5iaV9iZGV2IGluIGRyYmRfcmVxX25ldyIp
CkNvLWRldmVsb3BlZC1ieTogQ2hyaXN0b3BoIELDtmhtd2FsZGVyIDxjaHJpc3RvcGguYm9laG13
YWxkZXJAbGluYml0LmNvbT4KU2lnbmVkLW9mZi1ieTogQ2hyaXN0b3BoIELDtmhtd2FsZGVyIDxj
aHJpc3RvcGguYm9laG13YWxkZXJAbGluYml0LmNvbT4KQ28tZGV2ZWxvcGVkLWJ5OiBKb2VsIENv
bGxlZGdlIDxqb2VsLmNvbGxlZGdlQGxpbmJpdC5jb20+ClNpZ25lZC1vZmYtYnk6IEpvZWwgQ29s
bGVkZ2UgPGpvZWwuY29sbGVkZ2VAbGluYml0LmNvbT4KLS0tCiBkcml2ZXJzL2Jsb2NrL2RyYmQv
ZHJiZF9yZXEuYyB8IDEzICsrKysrLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlv
bnMoKyksIDggZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ibG9jay9kcmJkL2Ry
YmRfcmVxLmMgYi9kcml2ZXJzL2Jsb2NrL2RyYmQvZHJiZF9yZXEuYwppbmRleCA4ZjdmMTQ0ZTU0
ZjMuLjViOWUwMjVjMmJjNSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ibG9jay9kcmJkL2RyYmRfcmVx
LmMKKysrIGIvZHJpdmVycy9ibG9jay9kcmJkL2RyYmRfcmVxLmMKQEAgLTMwLDExICszMCw2IEBA
IHN0YXRpYyBzdHJ1Y3QgZHJiZF9yZXF1ZXN0ICpkcmJkX3JlcV9uZXcoc3RydWN0IGRyYmRfZGV2
aWNlICpkZXZpY2UsIHN0cnVjdCBiaW8KIAkJcmV0dXJuIE5VTEw7CiAJbWVtc2V0KHJlcSwgMCwg
c2l6ZW9mKCpyZXEpKTsKIAotCXJlcS0+cHJpdmF0ZV9iaW8gPSBiaW9fYWxsb2NfY2xvbmUoZGV2
aWNlLT5sZGV2LT5iYWNraW5nX2JkZXYsIGJpb19zcmMsCi0JCQkJCSAgIEdGUF9OT0lPLCAmZHJi
ZF9pb19iaW9fc2V0KTsKLQlyZXEtPnByaXZhdGVfYmlvLT5iaV9wcml2YXRlID0gcmVxOwotCXJl
cS0+cHJpdmF0ZV9iaW8tPmJpX2VuZF9pbyA9IGRyYmRfcmVxdWVzdF9lbmRpbzsKLQogCXJlcS0+
cnFfc3RhdGUgPSAoYmlvX2RhdGFfZGlyKGJpb19zcmMpID09IFdSSVRFID8gUlFfV1JJVEUgOiAw
KQogCQkgICAgICB8IChiaW9fb3AoYmlvX3NyYykgPT0gUkVRX09QX1dSSVRFX1pFUk9FUyA/IFJR
X1pFUk9FUyA6IDApCiAJCSAgICAgIHwgKGJpb19vcChiaW9fc3JjKSA9PSBSRVFfT1BfRElTQ0FS
RCA/IFJRX1VOTUFQIDogMCk7CkBAIC0xMjE5LDkgKzEyMTQsMTEgQEAgZHJiZF9yZXF1ZXN0X3By
ZXBhcmUoc3RydWN0IGRyYmRfZGV2aWNlICpkZXZpY2UsIHN0cnVjdCBiaW8gKmJpbykKIAkvKiBV
cGRhdGUgZGlzayBzdGF0cyAqLwogCXJlcS0+c3RhcnRfamlmID0gYmlvX3N0YXJ0X2lvX2FjY3Qo
cmVxLT5tYXN0ZXJfYmlvKTsKIAotCWlmICghZ2V0X2xkZXYoZGV2aWNlKSkgewotCQliaW9fcHV0
KHJlcS0+cHJpdmF0ZV9iaW8pOwotCQlyZXEtPnByaXZhdGVfYmlvID0gTlVMTDsKKwlpZiAoZ2V0
X2xkZXYoZGV2aWNlKSkgeworCQlyZXEtPnByaXZhdGVfYmlvID0gYmlvX2FsbG9jX2Nsb25lKGRl
dmljZS0+bGRldi0+YmFja2luZ19iZGV2LAorCQkJCQkJICAgYmlvLCBHRlBfTk9JTywgJmRyYmRf
aW9fYmlvX3NldCk7CisJCXJlcS0+cHJpdmF0ZV9iaW8tPmJpX3ByaXZhdGUgPSByZXE7CisJCXJl
cS0+cHJpdmF0ZV9iaW8tPmJpX2VuZF9pbyA9IGRyYmRfcmVxdWVzdF9lbmRpbzsKIAl9CiAKIAkv
KiBwcm9jZXNzIGRpc2NhcmRzIGFsd2F5cyBmcm9tIG91ciBzdWJtaXR0ZXIgdGhyZWFkICovCi0t
IAoyLjM3LjMKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyYmQtZGV2IG1haWxpbmcgbGlzdApkcmJkLWRldkBsaXN0cy5saW5iaXQuY29tCmh0dHBzOi8v
bGlzdHMubGluYml0LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2RyYmQtZGV2Cg==
