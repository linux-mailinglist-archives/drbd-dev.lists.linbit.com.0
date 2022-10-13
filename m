Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E8C35FDBA1
	for <lists+drbd-dev@lfdr.de>; Thu, 13 Oct 2022 15:53:22 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id D27A742095E;
	Thu, 13 Oct 2022 15:53:21 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
	[209.85.128.48])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 0C2104201C3
	for <drbd-dev@lists.linbit.com>; Thu, 13 Oct 2022 15:53:20 +0200 (CEST)
Received: by mail-wm1-f48.google.com with SMTP id
	m29-20020a05600c3b1d00b003c6bf423c71so2872368wms.0
	for <drbd-dev@lists.linbit.com>; Thu, 13 Oct 2022 06:53:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linbit-com.20210112.gappssmtp.com; s=20210112;
	h=content-transfer-encoding:mime-version:message-id:date:subject:cc
	:to:from:from:to:cc:subject:date:message-id:reply-to;
	bh=7OuLUBYXAOcE8pcq9/e9z3dyHvBPYPaNaSxybWb4IeQ=;
	b=iJPtJicN43I7vYtiBLEK061Z6o6nwoCYq95m9GtczXMd7MAZcAFqIwsQwmWIP2Om8h
	/k/wPtyoqztOS4XTz5bylrSJhmBEaWDkv9GRW2h0x2iiOpcbWozDnFkhJ2B6K1UbPIRP
	70yqwfG1Hl1LT6j76lVgmop9o+MO5IpUxW8CYGq07zLXfMhXxl5G2zCcqE3YKrZK/jJJ
	Ln0DSURFTkBeV/v9jX19Ol2tJzl9T9VMk90FXtr6aJOCY8UbtylOQVDkjosFGsBMd6Or
	WOVMfySpraUzGk3NDnmVVBA7Yvji7SGqmEpQUmyW+23u/9VwxuGMgLYvSUOvhHLwOpUe
	qa+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=content-transfer-encoding:mime-version:message-id:date:subject:cc
	:to:from:x-gm-message-state:from:to:cc:subject:date:message-id
	:reply-to;
	bh=7OuLUBYXAOcE8pcq9/e9z3dyHvBPYPaNaSxybWb4IeQ=;
	b=VLJlSgq8TVwmeXdxSOolDHZ7gvD4alvmmOqJTnurKfbWwlNysH8Hr2Mwgxop3qJH0+
	q+gRkzvdWEbMPUnVWlsVbHtMVLYTZxNzBzl2vLUCf6yAuLPEZaMQpECJgxkElOZEYwT0
	z/b7qGO7CzkYDqse4CbRzBz8v8YsRaKzaNk6QNsoKfDC4rvOOwGV3Svq2abX3OMDxjzh
	UVYSEvw+kEy3tGLu1n15hHZe5GdSZVFVioicmidPgmJzxCJAdpKl2AfdfgQoT7IIgycF
	+jVq2aUSs4RFUs28RUYAV0ybSfC3uGvxOWACPY1FbM+W9Bw57GzKmzKoaLRYMnzHKORu
	De6w==
X-Gm-Message-State: ACrzQf2J552qYY+/kmoVYgJC+iLi/3O3awTytfLXkHSjNvX8m41Vd1d4
	f2+2rkzvUC2mkBcPNECnEms0SrqM
X-Google-Smtp-Source: AMsMyM52nVzzf4JOMmR6/TA1aaThQ5YQ0URZybqKJb7Gldw54fnhQqj6kQv1Xev0LuxgOj2y5Zciww==
X-Received: by 2002:a05:600c:314a:b0:3c6:d75e:1abe with SMTP id
	h10-20020a05600c314a00b003c6d75e1abemr5342045wmo.71.1665669199953;
	Thu, 13 Oct 2022 06:53:19 -0700 (PDT)
Received: from localhost.localdomain (089144213149.atnat0022.highway.a1.net.
	[89.144.213.149]) by smtp.gmail.com with ESMTPSA id
	20-20020a05600c021400b003b4c979e6bcsm4473769wmi.10.2022.10.13.06.53.18
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 13 Oct 2022 06:53:19 -0700 (PDT)
From: =?UTF-8?q?Christoph=20B=C3=B6hmwalder?=
	<christoph.boehmwalder@linbit.com>
To: Jens Axboe <abxoe@kernel.dk>
Date: Thu, 13 Oct 2022 15:53:02 +0200
Message-Id: <20221013135302.933372-1-christoph.boehmwalder@linbit.com>
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
