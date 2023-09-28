Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 499907B17B3
	for <lists+drbd-dev@lfdr.de>; Thu, 28 Sep 2023 11:41:01 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 320C6426846;
	Thu, 28 Sep 2023 11:41:01 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
	[209.85.221.51])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id E1C12426846
	for <drbd-dev@lists.linbit.com>; Thu, 28 Sep 2023 11:39:03 +0200 (CEST)
Received: by mail-wr1-f51.google.com with SMTP id
	ffacd0b85a97d-3231d67aff2so9084288f8f.0
	for <drbd-dev@lists.linbit.com>; Thu, 28 Sep 2023 02:39:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linbit-com.20230601.gappssmtp.com; s=20230601; t=1695893943;
	x=1696498743; darn=lists.linbit.com; 
	h=content-transfer-encoding:mime-version:references:in-reply-to
	:message-id:date:subject:cc:to:from:from:to:cc:subject:date
	:message-id:reply-to;
	bh=nGK+HdR6obbUDfw8jsEAQzDJzPR9njsPrKQpwnxwsJU=;
	b=rDIhKhZn7frvW4aiIhHOp5k0UF/Xtd63ioHwDMaSmEaFcZbRimVKzbzrZQXTodSsWx
	BPnJsPbMbmM3Jz+47p6MMSA8RcB51tG6yIo6+4v2zuVq6oAgsGDcyuPBPOmu9PAXUXGk
	ZPaVpBeitAHu6U5NqYV33x+ErQpmDgm/AnDBSZrKedUSVeVXq3DdlgIDgXPCCUEdys+5
	jYwblY2OBDOWCBqmB9vcxfjb2XD9Kdymgokjt9rEMLQ64xX7kTNWBlds0wwy9N4ftEov
	3D6/C08yrDshsT1veqSrFU9BxAVw55lC478mKZAcdFPE25OMJ8Co2D1gGx88tU1rRj2O
	IdCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20230601; t=1695893943; x=1696498743;
	h=content-transfer-encoding:mime-version:references:in-reply-to
	:message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
	:subject:date:message-id:reply-to;
	bh=nGK+HdR6obbUDfw8jsEAQzDJzPR9njsPrKQpwnxwsJU=;
	b=dBdVKQ7sa0ICcGb9SOCrXCn0Cb7ilk7ot06k8P/FPR7xextvQC64BwcX/naQ+dOqrE
	gVoCRRgNlzrcPBZP6zU70AdGW1QgnRWJ4inAYnuxtVv37PvnkH0cDuknbXEyuM21yan9
	ggoNzqU+pNuW78YGVXp9C3OA0NpRHXuxz6FRE9GFcUjDeYIfNkYVmzNX+SVtGv7fzWfK
	BzxHHF5izlLS9PHzenkyIi6vNoWV3DrBDFe9tIlWlLmbJOVlAn40cL9qK1iz9xztnO1Q
	1m6KwONI4iJtESR1IfhfKPtdjDttLzRE62aasuSTLzKJWVX4ZZfnQ7evuV23jWSSCLu8
	aKdw==
X-Gm-Message-State: AOJu0YwXIXEastgvn1Zm94HWLGl/AniK+rOpBQQ5LFG8o6ckJmKX5IuF
	QbN5O+3DlL7bkF+KGwk3xBO+hbWzkqKUTFIfo15pKPLn
X-Google-Smtp-Source: AGHT+IEs9yBVflEyi8aWeeB2xlHf8uw7cl5KRIXN78um42kIokcnqkm/4b1KHILhnLQXF/9X9WINbA==
X-Received: by 2002:adf:d0cc:0:b0:31d:da10:e471 with SMTP id
	z12-20020adfd0cc000000b0031dda10e471mr696646wrh.69.1695893943541;
	Thu, 28 Sep 2023 02:39:03 -0700 (PDT)
Received: from localhost.localdomain (213-225-13-130.nat.highway.a1.net.
	[213.225.13.130]) by smtp.gmail.com with ESMTPSA id
	f4-20020a5d50c4000000b0031fa870d4b3sm18931449wrt.60.2023.09.28.02.39.02
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 28 Sep 2023 02:39:03 -0700 (PDT)
From: =?UTF-8?q?Christoph=20B=C3=B6hmwalder?=
	<christoph.boehmwalder@linbit.com>
To: Jens Axboe <axboe@kernel.dk>
Date: Thu, 28 Sep 2023 11:38:51 +0200
Message-ID: <20230928093852.676786-5-christoph.boehmwalder@linbit.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230928093852.676786-1-christoph.boehmwalder@linbit.com>
References: <20230928093852.676786-1-christoph.boehmwalder@linbit.com>
MIME-Version: 1.0
Cc: Lars Ellenberg <lars@linbit.com>, linux-kernel@vger.kernel.org,
	Philipp Reisner <philipp.reisner@linbit.com>,
	linux-block@vger.kernel.org, Christoph Hellwig <hch@lst.de>,
	drbd-dev@lists.linbit.com
Subject: [Drbd-dev] [PATCH 4/5] drbd: Keep connection threads running while
	connection is up only
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

Q29ubmVjdGlvbiBpbmRlcGVuZGVudCB3b3JrIGhhcyBiZWVuIG1vdmVkIGZyb20gdGhlIGNvbm5l
Y3Rpb24gInNlbmRlciIgdG8gdGhlCnJlc291cmNlICJ3b3JrZXIiLCBzbyB0aGVyZSBubyBsb25n
ZXIgaXMgYSBuZWVkIHRvIGtlZXAgdGhlICJzZW5kZXIiIHJ1bm5pbmcKd2hlbiB0aGUgY29ubmVj
dGlvbiBpcyBkb3duLgoKT3JpZ2luYWxseS1mcm9tOiBBbmRyZWFzIEdydWVuYmFjaGVyIDxhZ3J1
ZW5Aa2VybmVsLm9yZz4KUmV2aWV3ZWQtYnk6IEpvZWwgQ29sbGVkZ2UgPGpvZWwuY29sbGVkZ2VA
bGluYml0LmNvbT4KU2lnbmVkLW9mZi1ieTogQ2hyaXN0b3BoIELDtmhtd2FsZGVyIDxjaHJpc3Rv
cGguYm9laG13YWxkZXJAbGluYml0LmNvbT4KLS0tCiBkcml2ZXJzL2Jsb2NrL2RyYmQvZHJiZF9u
bC5jICAgIHwgIDYgKy0tLS0tCiBkcml2ZXJzL2Jsb2NrL2RyYmQvZHJiZF9zdGF0ZS5jIHwgMjEg
LS0tLS0tLS0tLS0tLS0tLS0tLS0tCiBkcml2ZXJzL2Jsb2NrL2RyYmQvZHJiZF9zdGF0ZS5oIHwg
IDEgLQogMyBmaWxlcyBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMjcgZGVsZXRpb25zKC0pCgpk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ibG9jay9kcmJkL2RyYmRfbmwuYyBiL2RyaXZlcnMvYmxvY2sv
ZHJiZC9kcmJkX25sLmMKaW5kZXggOWQ5Y2VkNDZmOTY4Li44NWFiNmYwZjlkODcgMTAwNjQ0Ci0t
LSBhL2RyaXZlcnMvYmxvY2svZHJiZC9kcmJkX25sLmMKKysrIGIvZHJpdmVycy9ibG9jay9kcmJk
L2RyYmRfbmwuYwpAQCAtMTM2MSw4ICsxMzYxLDcgQEAgc3RhdGljIHZvaWQgY29ubl9yZWNvbmZp
Z19kb25lKHN0cnVjdCBkcmJkX2Nvbm5lY3Rpb24gKmNvbm5lY3Rpb24pCiB7CiAJYm9vbCBzdG9w
X3RocmVhZHM7CiAJc3Bpbl9sb2NrX2lycSgmY29ubmVjdGlvbi0+cmVzb3VyY2UtPnJlcV9sb2Nr
KTsKLQlzdG9wX3RocmVhZHMgPSBjb25uX2FsbF92b2xzX3VuY29uZihjb25uZWN0aW9uKSAmJgot
CQljb25uZWN0aW9uLT5jc3RhdGUgPT0gQ19TVEFOREFMT05FOworCXN0b3BfdGhyZWFkcyA9IGNv
bm5lY3Rpb24tPmNzdGF0ZSA9PSBDX1NUQU5EQUxPTkU7CiAJc3Bpbl91bmxvY2tfaXJxKCZjb25u
ZWN0aW9uLT5yZXNvdXJjZS0+cmVxX2xvY2spOwogCWlmIChzdG9wX3RocmVhZHMpIHsKIAkJLyog
YWNrX3JlY2VpdmVyIHRocmVhZCBhbmQgYWNrX3NlbmRlciB3b3JrcXVldWUgYXJlIGltcGxpY2l0
bHkKQEAgLTE3NDksNyArMTc0OCw2IEBAIGludCBkcmJkX2FkbV9hdHRhY2goc3RydWN0IHNrX2J1
ZmYgKnNrYiwgc3RydWN0IGdlbmxfaW5mbyAqaW5mbykKIAltdXRleF9sb2NrKCZhZG1fY3R4LnJl
c291cmNlLT5hZG1fbXV0ZXgpOwogCXBlZXJfZGV2aWNlID0gZmlyc3RfcGVlcl9kZXZpY2UoZGV2
aWNlKTsKIAljb25uZWN0aW9uID0gcGVlcl9kZXZpY2UtPmNvbm5lY3Rpb247Ci0JY29ubl9yZWNv
bmZpZ19zdGFydChjb25uZWN0aW9uKTsKIAogCS8qIGlmIHlvdSB3YW50IHRvIHJlY29uZmlndXJl
LCBwbGVhc2UgdGVhciBkb3duIGZpcnN0ICovCiAJaWYgKGRldmljZS0+c3RhdGUuZGlzayA+IERf
RElTS0xFU1MpIHsKQEAgLTIxMTcsNyArMjExNSw2IEBAIGludCBkcmJkX2FkbV9hdHRhY2goc3Ry
dWN0IHNrX2J1ZmYgKnNrYiwgc3RydWN0IGdlbmxfaW5mbyAqaW5mbykKIAogCWtvYmplY3RfdWV2
ZW50KCZkaXNrX3RvX2RldihkZXZpY2UtPnZkaXNrKS0+a29iaiwgS09CSl9DSEFOR0UpOwogCXB1
dF9sZGV2KGRldmljZSk7Ci0JY29ubl9yZWNvbmZpZ19kb25lKGNvbm5lY3Rpb24pOwogCW11dGV4
X3VubG9jaygmYWRtX2N0eC5yZXNvdXJjZS0+YWRtX211dGV4KTsKIAlkcmJkX2FkbV9maW5pc2go
JmFkbV9jdHgsIGluZm8sIHJldGNvZGUpOwogCXJldHVybiAwOwpAQCAtMjEyOCw3ICsyMTI1LDYg
QEAgaW50IGRyYmRfYWRtX2F0dGFjaChzdHJ1Y3Qgc2tfYnVmZiAqc2tiLCBzdHJ1Y3QgZ2VubF9p
bmZvICppbmZvKQogCWRyYmRfZm9yY2Vfc3RhdGUoZGV2aWNlLCBOUyhkaXNrLCBEX0RJU0tMRVNT
KSk7CiAJZHJiZF9tZF9zeW5jKGRldmljZSk7CiAgZmFpbDoKLQljb25uX3JlY29uZmlnX2RvbmUo
Y29ubmVjdGlvbik7CiAJaWYgKG5iYykgewogCQljbG9zZV9iYWNraW5nX2RldihkZXZpY2UsIG5i
Yy0+bWRfYmRldiwKIAkJCSAgbmJjLT5kaXNrX2NvbmYtPm1ldGFfZGV2X2lkeCA8IDAgPwpkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ibG9jay9kcmJkL2RyYmRfc3RhdGUuYyBiL2RyaXZlcnMvYmxvY2sv
ZHJiZC9kcmJkX3N0YXRlLmMKaW5kZXggYzYyMzc2OWFiYzFhLi4wYTkwMWU1YWNhMGEgMTAwNjQ0
Ci0tLSBhL2RyaXZlcnMvYmxvY2svZHJiZC9kcmJkX3N0YXRlLmMKKysrIGIvZHJpdmVycy9ibG9j
ay9kcmJkL2RyYmRfc3RhdGUuYwpAQCAtMjkxLDI3ICsyOTEsNiBAQCBzdGF0aWMgaW5saW5lIGJv
b2wgaXNfc3VzcCh1bmlvbiBkcmJkX3N0YXRlIHMpCiAgICAgICAgIHJldHVybiBzLnN1c3AgfHwg
cy5zdXNwX25vZCB8fCBzLnN1c3BfZmVuOwogfQogCi1ib29sIGNvbm5fYWxsX3ZvbHNfdW5jb25m
KHN0cnVjdCBkcmJkX2Nvbm5lY3Rpb24gKmNvbm5lY3Rpb24pCi17Ci0Jc3RydWN0IGRyYmRfcGVl
cl9kZXZpY2UgKnBlZXJfZGV2aWNlOwotCWJvb2wgcnYgPSB0cnVlOwotCWludCB2bnI7Ci0KLQly
Y3VfcmVhZF9sb2NrKCk7Ci0JaWRyX2Zvcl9lYWNoX2VudHJ5KCZjb25uZWN0aW9uLT5wZWVyX2Rl
dmljZXMsIHBlZXJfZGV2aWNlLCB2bnIpIHsKLQkJc3RydWN0IGRyYmRfZGV2aWNlICpkZXZpY2Ug
PSBwZWVyX2RldmljZS0+ZGV2aWNlOwotCQlpZiAoZGV2aWNlLT5zdGF0ZS5kaXNrICE9IERfRElT
S0xFU1MgfHwKLQkJICAgIGRldmljZS0+c3RhdGUuY29ubiAhPSBDX1NUQU5EQUxPTkUgfHwKLQkJ
ICAgIGRldmljZS0+c3RhdGUucm9sZSAhPSBSX1NFQ09OREFSWSkgewotCQkJcnYgPSBmYWxzZTsK
LQkJCWJyZWFrOwotCQl9Ci0JfQotCXJjdV9yZWFkX3VubG9jaygpOwotCi0JcmV0dXJuIHJ2Owot
fQotCiAvKiBVbmZvcnR1bmF0ZWx5IHRoZSBzdGF0ZXMgd2hlcmUgbm90IGNvcnJlY3RseSBvcmRl
cmVkLCB3aGVuCiAgICB0aGV5IHdoZXJlIGRlZmluZWQuIHRoZXJlZm9yZSBjYW4gbm90IHVzZSBt
YXhfdCgpIGhlcmUuICovCiBzdGF0aWMgZW51bSBkcmJkX3JvbGUgbWF4X3JvbGUoZW51bSBkcmJk
X3JvbGUgcm9sZTEsIGVudW0gZHJiZF9yb2xlIHJvbGUyKQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9i
bG9jay9kcmJkL2RyYmRfc3RhdGUuaCBiL2RyaXZlcnMvYmxvY2svZHJiZC9kcmJkX3N0YXRlLmgK
aW5kZXggY2JhZWI4MDE4ZGJmLi42NzM3MWJkNTYzZTQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvYmxv
Y2svZHJiZC9kcmJkX3N0YXRlLmgKKysrIGIvZHJpdmVycy9ibG9jay9kcmJkL2RyYmRfc3RhdGUu
aApAQCAtMTQyLDcgKzE0Miw2IEBAIGNvbm5fcmVxdWVzdF9zdGF0ZShzdHJ1Y3QgZHJiZF9jb25u
ZWN0aW9uICpjb25uZWN0aW9uLCB1bmlvbiBkcmJkX3N0YXRlIG1hc2ssIHVuCiAJCSAgIGVudW0g
Y2hnX3N0YXRlX2ZsYWdzIGZsYWdzKTsKIAogZXh0ZXJuIHZvaWQgZHJiZF9yZXN1bWVfYWwoc3Ry
dWN0IGRyYmRfZGV2aWNlICpkZXZpY2UpOwotZXh0ZXJuIGJvb2wgY29ubl9hbGxfdm9sc191bmNv
bmYoc3RydWN0IGRyYmRfY29ubmVjdGlvbiAqY29ubmVjdGlvbik7CiAKIC8qKgogICogZHJiZF9y
ZXF1ZXN0X3N0YXRlKCkgLSBSZXF1ZXN0IGEgc3RhdGUgY2hhbmdlCi0tIAoyLjQxLjAKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyYmQtZGV2IG1haWxp
bmcgbGlzdApkcmJkLWRldkBsaXN0cy5saW5iaXQuY29tCmh0dHBzOi8vbGlzdHMubGluYml0LmNv
bS9tYWlsbWFuL2xpc3RpbmZvL2RyYmQtZGV2Cg==
