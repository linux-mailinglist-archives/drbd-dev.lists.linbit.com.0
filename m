Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D7F3605A44
	for <lists+drbd-dev@lfdr.de>; Thu, 20 Oct 2022 10:52:53 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id F122F420968;
	Thu, 20 Oct 2022 10:52:52 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
	[209.85.221.49])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 8757A4206CF
	for <drbd-dev@lists.linbit.com>; Thu, 20 Oct 2022 10:52:51 +0200 (CEST)
Received: by mail-wr1-f49.google.com with SMTP id u10so33254424wrq.2
	for <drbd-dev@lists.linbit.com>; Thu, 20 Oct 2022 01:52:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linbit-com.20210112.gappssmtp.com; s=20210112;
	h=content-transfer-encoding:mime-version:message-id:date:subject:cc
	:to:from:from:to:cc:subject:date:message-id:reply-to;
	bh=fxJKiEotGSWnJtU5023vvPUDcYNa2O9fl/RCysq+NZA=;
	b=CmP3VgGnictPB7LKKm5de97ljCHY369aWKMvv2xLSdFmS2DeCVFc6Z9czgE1Dk/U7/
	VyK1kIEbW0pmuuLffv8j6kySncqAJ8V9/FDA1rg8qQGVo3ke0WGrPRmcg2urSSs29hxk
	LBg3V8XSAVOzs2K7dp1kc8pTw4iPmcmRHqJdR1vWCDbpsTEG9crmhrOB3HYQYGUODobE
	jAVnxtjHyfPe2VgdaZn00vNh09lrjBVkifh2je1viTI9LGoZpAkogxDSA5IoWxLEoTj5
	YemzS5ly8MaTIiJIdGpBIk8eFHW+wOLh6jfbyP6OB20QNb0LgRCgvIR80Rm21DN6wlOX
	AF/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=content-transfer-encoding:mime-version:message-id:date:subject:cc
	:to:from:x-gm-message-state:from:to:cc:subject:date:message-id
	:reply-to;
	bh=fxJKiEotGSWnJtU5023vvPUDcYNa2O9fl/RCysq+NZA=;
	b=TAaQKeUhpywCBQFv5/7cn12J31q2KEZPYj2rr7TgZ/od8bb5wj0aHoTP+FdBn3PR1T
	da+7jeVD4epZStr+73UzPbVA/3tUTtmpLUC/ljq7f30/IPxvM6R6+8q8ml0x6RgEu7Zf
	nwd9TaH7n2YklScJAuhLU0b93YaZ3kjJAQl2u4WY/nK35pR3TMXiSo3HkUH7rK5CI8Yd
	2OeYCkrO1E6zNOmzyPSs8qwvtR2nIs0FBICmD7Dh9pTwBtqqI6uNGfv+VZ9HjkXpMdnE
	gV3FHrrX/1wBNABUy6n/btpyS8Fr9bj0QqCWV5DgiWzXxhnxQ71VOP0Co+udCRHKackT
	SpDw==
X-Gm-Message-State: ACrzQf3oXGz5MTSbeIV83XvjF0CEcRylDilOoYtmHVSUxq6zTb3DZjeY
	/9LDyRjWLDcAvvga9aUnMZ37yUtr
X-Google-Smtp-Source: AMsMyM5aImbG8bVRLMpXktjc/gAOVl/L1zQG4Vzf0bERE8RpGUb1vgAIW6AnFp5nhL1A0UyViy7sBQ==
X-Received: by 2002:a5d:4683:0:b0:22e:6be0:dfc6 with SMTP id
	u3-20020a5d4683000000b0022e6be0dfc6mr7915288wrq.573.1666255970764;
	Thu, 20 Oct 2022 01:52:50 -0700 (PDT)
Received: from localhost.localdomain (h082218028181.host.wavenet.at.
	[82.218.28.181]) by smtp.gmail.com with ESMTPSA id
	f10-20020a05600c4e8a00b003a84375d0d1sm2409409wmq.44.2022.10.20.01.52.49
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 20 Oct 2022 01:52:50 -0700 (PDT)
From: =?UTF-8?q?Christoph=20B=C3=B6hmwalder?=
	<christoph.boehmwalder@linbit.com>
To: Jens Axboe <axboe@kernel.dk>
Date: Thu, 20 Oct 2022 10:52:05 +0200
Message-Id: <20221020085205.129090-1-christoph.boehmwalder@linbit.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Cc: Philipp Reisner <philipp.reisner@linbit.com>, linux-kernel@vger.kernel.org,
	linux-block@vger.kernel.org, Lars Ellenberg <lars.ellenberg@linbit.com>,
	Christoph Hellwig <hch@lst.de>, drbd-dev@lists.linbit.com
Subject: [Drbd-dev] [PATCH v2] drbd: only clone bio if we have a backing
	device
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
bGVkZ2UgPGpvZWwuY29sbGVkZ2VAbGluYml0LmNvbT4KUmV2aWV3ZWQtYnk6IENocmlzdG9waCBI
ZWxsd2lnIDxoY2hAbHN0LmRlPgotLS0KQ2hhbmdlcyBpbiB2MjoKICAgIC0gRml4IGFuIG92ZXJs
eSBsb25nIGxpbmUKLS0tCiBkcml2ZXJzL2Jsb2NrL2RyYmQvZHJiZF9yZXEuYyB8IDE0ICsrKysr
Ky0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCA4IGRlbGV0aW9ucygt
KQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvYmxvY2svZHJiZC9kcmJkX3JlcS5jIGIvZHJpdmVycy9i
bG9jay9kcmJkL2RyYmRfcmVxLmMKaW5kZXggOGY3ZjE0NGU1NGYzLi43ZjliY2M4MmZjOWMgMTAw
NjQ0Ci0tLSBhL2RyaXZlcnMvYmxvY2svZHJiZC9kcmJkX3JlcS5jCisrKyBiL2RyaXZlcnMvYmxv
Y2svZHJiZC9kcmJkX3JlcS5jCkBAIC0zMCwxMSArMzAsNiBAQCBzdGF0aWMgc3RydWN0IGRyYmRf
cmVxdWVzdCAqZHJiZF9yZXFfbmV3KHN0cnVjdCBkcmJkX2RldmljZSAqZGV2aWNlLCBzdHJ1Y3Qg
YmlvCiAJCXJldHVybiBOVUxMOwogCW1lbXNldChyZXEsIDAsIHNpemVvZigqcmVxKSk7CiAKLQly
ZXEtPnByaXZhdGVfYmlvID0gYmlvX2FsbG9jX2Nsb25lKGRldmljZS0+bGRldi0+YmFja2luZ19i
ZGV2LCBiaW9fc3JjLAotCQkJCQkgICBHRlBfTk9JTywgJmRyYmRfaW9fYmlvX3NldCk7Ci0JcmVx
LT5wcml2YXRlX2Jpby0+YmlfcHJpdmF0ZSA9IHJlcTsKLQlyZXEtPnByaXZhdGVfYmlvLT5iaV9l
bmRfaW8gPSBkcmJkX3JlcXVlc3RfZW5kaW87Ci0KIAlyZXEtPnJxX3N0YXRlID0gKGJpb19kYXRh
X2RpcihiaW9fc3JjKSA9PSBXUklURSA/IFJRX1dSSVRFIDogMCkKIAkJICAgICAgfCAoYmlvX29w
KGJpb19zcmMpID09IFJFUV9PUF9XUklURV9aRVJPRVMgPyBSUV9aRVJPRVMgOiAwKQogCQkgICAg
ICB8IChiaW9fb3AoYmlvX3NyYykgPT0gUkVRX09QX0RJU0NBUkQgPyBSUV9VTk1BUCA6IDApOwpA
QCAtMTIxOSw5ICsxMjE0LDEyIEBAIGRyYmRfcmVxdWVzdF9wcmVwYXJlKHN0cnVjdCBkcmJkX2Rl
dmljZSAqZGV2aWNlLCBzdHJ1Y3QgYmlvICpiaW8pCiAJLyogVXBkYXRlIGRpc2sgc3RhdHMgKi8K
IAlyZXEtPnN0YXJ0X2ppZiA9IGJpb19zdGFydF9pb19hY2N0KHJlcS0+bWFzdGVyX2Jpbyk7CiAK
LQlpZiAoIWdldF9sZGV2KGRldmljZSkpIHsKLQkJYmlvX3B1dChyZXEtPnByaXZhdGVfYmlvKTsK
LQkJcmVxLT5wcml2YXRlX2JpbyA9IE5VTEw7CisJaWYgKGdldF9sZGV2KGRldmljZSkpIHsKKwkJ
cmVxLT5wcml2YXRlX2JpbyA9IGJpb19hbGxvY19jbG9uZShkZXZpY2UtPmxkZXYtPmJhY2tpbmdf
YmRldiwKKwkJCQkJCSAgIGJpbywgR0ZQX05PSU8sCisJCQkJCQkgICAmZHJiZF9pb19iaW9fc2V0
KTsKKwkJcmVxLT5wcml2YXRlX2Jpby0+YmlfcHJpdmF0ZSA9IHJlcTsKKwkJcmVxLT5wcml2YXRl
X2Jpby0+YmlfZW5kX2lvID0gZHJiZF9yZXF1ZXN0X2VuZGlvOwogCX0KIAogCS8qIHByb2Nlc3Mg
ZGlzY2FyZHMgYWx3YXlzIGZyb20gb3VyIHN1Ym1pdHRlciB0aHJlYWQgKi8KLS0gCjIuMzcuMwoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJiZC1kZXYg
bWFpbGluZyBsaXN0CmRyYmQtZGV2QGxpc3RzLmxpbmJpdC5jb20KaHR0cHM6Ly9saXN0cy5saW5i
aXQuY29tL21haWxtYW4vbGlzdGluZm8vZHJiZC1kZXYK
