Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id F03754F699C
	for <lists+drbd-dev@lfdr.de>; Wed,  6 Apr 2022 21:10:01 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id D73E6420FF3;
	Wed,  6 Apr 2022 21:10:01 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com
	[209.85.208.52])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 61D524205EF
	for <drbd-dev@lists.linbit.com>; Wed,  6 Apr 2022 21:07:38 +0200 (CEST)
Received: by mail-ed1-f52.google.com with SMTP id d7so3765585edn.11
	for <drbd-dev@lists.linbit.com>; Wed, 06 Apr 2022 12:07:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linbit-com.20210112.gappssmtp.com; s=20210112;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=POlr1a0iTGBoJ3bnuukX0R50RftAjAl0lTvKR+vp4fE=;
	b=lsMjsM8hxfLRElDhpBGCBQAWVxHPdgBMTP0fgUwIURdERrRguIPnGMBktd9IeLNUl0
	QTSMQCDikvX/cPN4g0moz7n7yXWOVjRvKJpzHbdmQloqYiAZ7qGSl0P1uWyEnLMl7bcJ
	HVIl/2ATefvZPve2FGSxSnvynVBVVDeGqyCmU51duL5Gz88iDLthmoj7DrGz/XEBVeJx
	TfUA1W0R58CKFNnbhiFvGEoZyqocemong5+RmVpQYF7FkgQk/ygaQM2FubSmPfq2UFvt
	o3/f9QlfBKhhliDJUZ9nKbRTy8tu9dd4L1S+zc3gkU7pgvMH20Mnegiwv2iqGAk32ZGC
	K2tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=POlr1a0iTGBoJ3bnuukX0R50RftAjAl0lTvKR+vp4fE=;
	b=KRlBn47AaDJhS4x+26LGnIFc6KD1nwXqL5SOVVFreB60Mb4CCBXvTcGQ9jmDyJos9N
	XYyC/kPhkdpvMHc964Lpmjz97vigDLXeOsCsEeB0IDg4YfDc3kG+kMKDWztxMrU4TnFn
	0naEflrGxV/OtdKy5JEca77JRmB3D0rcsbQzHs+WXToft7gbdXvAP1rX20xd/gQ3TXNi
	MRmcESm1shIrxA6Mfzr/rfOPEZy5Wc3m79txSvihyKJ8rOgiIvjOvopBvYKXpbv09I6z
	11lXpMp9VAEVrWlSdxiGb/3MLvszp2ZfiuYlNH/xfyVhezaX2GcizJz2SEfkuMT8g8JP
	Udcw==
X-Gm-Message-State: AOAM530shX8KnviYF194BaGn+AGNU0QQuzBwn+2UNpJo3cOk43dnchua
	KFDTgdjSYsdoXlVzYTvqTcbnza86
X-Google-Smtp-Source: ABdhPJyO9677zCd7VbzMR7POWXOfRfPVkPceRUPrJkIhga3FMwv044ystxo1E0V0UEFKxVx4KhhlTA==
X-Received: by 2002:a05:6402:2050:b0:41c:dd5e:3c63 with SMTP id
	bc16-20020a056402205000b0041cdd5e3c63mr10339789edb.56.1649272057830;
	Wed, 06 Apr 2022 12:07:37 -0700 (PDT)
Received: from localhost (85-127-190-169.dsl.dynamic.surfer.at.
	[85.127.190.169]) by smtp.gmail.com with ESMTPSA id
	c3-20020a17090654c300b006e4e1a3e9d5sm6404685ejp.144.2022.04.06.12.07.37
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 06 Apr 2022 12:07:37 -0700 (PDT)
From: =?UTF-8?q?Christoph=20B=C3=B6hmwalder?=
	<christoph.boehmwalder@linbit.com>
To: Jens Axboe <axboe@kernel.dk>
Date: Wed,  6 Apr 2022 21:07:14 +0200
Message-Id: <20220406190715.1938174-7-christoph.boehmwalder@linbit.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220406190715.1938174-1-christoph.boehmwalder@linbit.com>
References: <20220406190715.1938174-1-christoph.boehmwalder@linbit.com>
MIME-Version: 1.0
Cc: Philipp Reisner <philipp.reisner@linbit.com>, linux-kernel@vger.kernel.org,
	linux-block@vger.kernel.org,
	"Uladzislau Rezki \(Sony\)" <urezki@gmail.com>,
	Lars Ellenberg <lars.ellenberg@linbit.com>, drbd-dev@lists.linbit.com
Subject: [Drbd-dev] [PATCH 6/7] drdb: Switch to kvfree_rcu() API
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

RnJvbTogIlVsYWR6aXNsYXUgUmV6a2kgKFNvbnkpIiA8dXJlemtpQGdtYWlsLmNvbT4KCkluc3Rl
YWQgb2YgaW52b2tpbmcgYSBzeW5jaHJvbml6ZV9yY3UoKSB0byBmcmVlIGEgcG9pbnRlcgphZnRl
ciBhIGdyYWNlIHBlcmlvZCB3ZSBjYW4gZGlyZWN0bHkgbWFrZSB1c2Ugb2YgbmV3IEFQSQp0aGF0
IGRvZXMgdGhlIHNhbWUgYnV0IGluIG1vcmUgZWZmaWNpZW50IHdheS4KClRPOiBKZW5zIEF4Ym9l
IDxheGJvZUBrZXJuZWwuZGs+ClRPOiBQaGlsaXBwIFJlaXNuZXIgPHBoaWxpcHAucmVpc25lckBs
aW5iaXQuY29tPgpUTzogSmFzb24gR3VudGhvcnBlIDxqZ2dAbnZpZGlhLmNvbT4KVE86IGRyYmQt
ZGV2QGxpc3RzLmxpbmJpdC5jb20KVE86IGxpbnV4LWJsb2NrQHZnZXIua2VybmVsLm9yZwpTaWdu
ZWQtb2ZmLWJ5OiBVbGFkemlzbGF1IFJlemtpIChTb255KSA8dXJlemtpQGdtYWlsLmNvbT4KUmV2
aWV3ZWQtYnk6IENocmlzdG9waCBCw7ZobXdhbGRlciA8Y2hyaXN0b3BoLmJvZWhtd2FsZGVyQGxp
bmJpdC5jb20+Ci0tLQogZHJpdmVycy9ibG9jay9kcmJkL2RyYmRfbmwuYyAgICAgICB8IDkgKysr
LS0tLS0tCiBkcml2ZXJzL2Jsb2NrL2RyYmQvZHJiZF9yZWNlaXZlci5jIHwgNiArKy0tLS0KIGRy
aXZlcnMvYmxvY2svZHJiZC9kcmJkX3N0YXRlLmMgICAgfCAzICstLQogMyBmaWxlcyBjaGFuZ2Vk
LCA2IGluc2VydGlvbnMoKyksIDEyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMv
YmxvY2svZHJiZC9kcmJkX25sLmMgYi9kcml2ZXJzL2Jsb2NrL2RyYmQvZHJiZF9ubC5jCmluZGV4
IDA3NGI4ODRlYzIyNS4uYWQ2ZTQwODY0YjM3IDEwMDY0NAotLS0gYS9kcml2ZXJzL2Jsb2NrL2Ry
YmQvZHJiZF9ubC5jCisrKyBiL2RyaXZlcnMvYmxvY2svZHJiZC9kcmJkX25sLmMKQEAgLTE2MTIs
OCArMTYxMiw3IEBAIGludCBkcmJkX2FkbV9kaXNrX29wdHMoc3RydWN0IHNrX2J1ZmYgKnNrYiwg
c3RydWN0IGdlbmxfaW5mbyAqaW5mbykKIAkJCWRyYmRfc2VuZF9zeW5jX3BhcmFtKHBlZXJfZGV2
aWNlKTsKIAl9CiAKLQlzeW5jaHJvbml6ZV9yY3UoKTsKLQlrZnJlZShvbGRfZGlza19jb25mKTsK
KwlrdmZyZWVfcmN1KG9sZF9kaXNrX2NvbmYpOwogCWtmcmVlKG9sZF9wbGFuKTsKIAltb2RfdGlt
ZXIoJmRldmljZS0+cmVxdWVzdF90aW1lciwgamlmZmllcyArIEhaKTsKIAlnb3RvIHN1Y2Nlc3M7
CkBAIC0yNDQ0LDggKzI0NDMsNyBAQCBpbnQgZHJiZF9hZG1fbmV0X29wdHMoc3RydWN0IHNrX2J1
ZmYgKnNrYiwgc3RydWN0IGdlbmxfaW5mbyAqaW5mbykKIAogCW11dGV4X3VubG9jaygmY29ubmVj
dGlvbi0+cmVzb3VyY2UtPmNvbmZfdXBkYXRlKTsKIAltdXRleF91bmxvY2soJmNvbm5lY3Rpb24t
PmRhdGEubXV0ZXgpOwotCXN5bmNocm9uaXplX3JjdSgpOwotCWtmcmVlKG9sZF9uZXRfY29uZik7
CisJa3ZmcmVlX3JjdShvbGRfbmV0X2NvbmYpOwogCiAJaWYgKGNvbm5lY3Rpb24tPmNzdGF0ZSA+
PSBDX1dGX1JFUE9SVF9QQVJBTVMpIHsKIAkJc3RydWN0IGRyYmRfcGVlcl9kZXZpY2UgKnBlZXJf
ZGV2aWNlOwpAQCAtMjg1OSw4ICsyODU3LDcgQEAgaW50IGRyYmRfYWRtX3Jlc2l6ZShzdHJ1Y3Qg
c2tfYnVmZiAqc2tiLCBzdHJ1Y3QgZ2VubF9pbmZvICppbmZvKQogCQluZXdfZGlza19jb25mLT5k
aXNrX3NpemUgPSAoc2VjdG9yX3QpcnMucmVzaXplX3NpemU7CiAJCXJjdV9hc3NpZ25fcG9pbnRl
cihkZXZpY2UtPmxkZXYtPmRpc2tfY29uZiwgbmV3X2Rpc2tfY29uZik7CiAJCW11dGV4X3VubG9j
aygmZGV2aWNlLT5yZXNvdXJjZS0+Y29uZl91cGRhdGUpOwotCQlzeW5jaHJvbml6ZV9yY3UoKTsK
LQkJa2ZyZWUob2xkX2Rpc2tfY29uZik7CisJCWt2ZnJlZV9yY3Uob2xkX2Rpc2tfY29uZik7CiAJ
CW5ld19kaXNrX2NvbmYgPSBOVUxMOwogCX0KIApkaWZmIC0tZ2l0IGEvZHJpdmVycy9ibG9jay9k
cmJkL2RyYmRfcmVjZWl2ZXIuYyBiL2RyaXZlcnMvYmxvY2svZHJiZC9kcmJkX3JlY2VpdmVyLmMK
aW5kZXggMDgyNTc2NmNlOTEwLi41ZTEwNTcyYTRkM2UgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvYmxv
Y2svZHJiZC9kcmJkX3JlY2VpdmVyLmMKKysrIGIvZHJpdmVycy9ibG9jay9kcmJkL2RyYmRfcmVj
ZWl2ZXIuYwpAQCAtMzc1MSw4ICszNzUxLDcgQEAgc3RhdGljIGludCByZWNlaXZlX3Byb3RvY29s
KHN0cnVjdCBkcmJkX2Nvbm5lY3Rpb24gKmNvbm5lY3Rpb24sIHN0cnVjdCBwYWNrZXRfaW4KIAkJ
ZHJiZF9pbmZvKGNvbm5lY3Rpb24sICJwZWVyIGRhdGEtaW50ZWdyaXR5LWFsZzogJXNcbiIsCiAJ
CQkgIGludGVncml0eV9hbGdbMF0gPyBpbnRlZ3JpdHlfYWxnIDogIihub25lKSIpOwogCi0Jc3lu
Y2hyb25pemVfcmN1KCk7Ci0Ja2ZyZWUob2xkX25ldF9jb25mKTsKKwlrdmZyZWVfcmN1KG9sZF9u
ZXRfY29uZik7CiAJcmV0dXJuIDA7CiAKIGRpc2Nvbm5lY3RfcmN1X3VubG9jazoKQEAgLTQxMjAs
OCArNDExOSw3IEBAIHN0YXRpYyBpbnQgcmVjZWl2ZV9zaXplcyhzdHJ1Y3QgZHJiZF9jb25uZWN0
aW9uICpjb25uZWN0aW9uLCBzdHJ1Y3QgcGFja2V0X2luZm8KIAogCQkJcmN1X2Fzc2lnbl9wb2lu
dGVyKGRldmljZS0+bGRldi0+ZGlza19jb25mLCBuZXdfZGlza19jb25mKTsKIAkJCW11dGV4X3Vu
bG9jaygmY29ubmVjdGlvbi0+cmVzb3VyY2UtPmNvbmZfdXBkYXRlKTsKLQkJCXN5bmNocm9uaXpl
X3JjdSgpOwotCQkJa2ZyZWUob2xkX2Rpc2tfY29uZik7CisJCQlrdmZyZWVfcmN1KG9sZF9kaXNr
X2NvbmYpOwogCiAJCQlkcmJkX2luZm8oZGV2aWNlLCAiUGVlciBzZXRzIHVfc2l6ZSB0byAlbHUg
c2VjdG9ycyAob2xkOiAlbHUpXG4iLAogCQkJCSAodW5zaWduZWQgbG9uZylwX3VzaXplLCAodW5z
aWduZWQgbG9uZylteV91c2l6ZSk7CmRpZmYgLS1naXQgYS9kcml2ZXJzL2Jsb2NrL2RyYmQvZHJi
ZF9zdGF0ZS5jIGIvZHJpdmVycy9ibG9jay9kcmJkL2RyYmRfc3RhdGUuYwppbmRleCBiOGEyNzgx
OGFiM2YuLjgyNmU0OTY4MjFjNyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ibG9jay9kcmJkL2RyYmRf
c3RhdGUuYworKysgYi9kcml2ZXJzL2Jsb2NrL2RyYmQvZHJiZF9zdGF0ZS5jCkBAIC0yMDcxLDgg
KzIwNzEsNyBAQCBzdGF0aWMgaW50IHdfYWZ0ZXJfY29ubl9zdGF0ZV9jaChzdHJ1Y3QgZHJiZF93
b3JrICp3LCBpbnQgdW51c2VkKQogCQljb25uX2ZyZWVfY3J5cHRvKGNvbm5lY3Rpb24pOwogCQlt
dXRleF91bmxvY2soJmNvbm5lY3Rpb24tPnJlc291cmNlLT5jb25mX3VwZGF0ZSk7CiAKLQkJc3lu
Y2hyb25pemVfcmN1KCk7Ci0JCWtmcmVlKG9sZF9jb25mKTsKKwkJa3ZmcmVlX3JjdShvbGRfY29u
Zik7CiAJfQogCiAJaWYgKG5zX21heC5zdXNwX2ZlbikgewotLSAKMi4zNS4xCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmJkLWRldiBtYWlsaW5nIGxp
c3QKZHJiZC1kZXZAbGlzdHMubGluYml0LmNvbQpodHRwczovL2xpc3RzLmxpbmJpdC5jb20vbWFp
bG1hbi9saXN0aW5mby9kcmJkLWRldgo=
