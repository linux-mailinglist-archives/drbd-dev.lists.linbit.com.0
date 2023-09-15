Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CAB17A278E
	for <lists+drbd-dev@lfdr.de>; Fri, 15 Sep 2023 22:03:21 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id B53CE425C97;
	Fri, 15 Sep 2023 22:03:20 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com
	[209.85.210.170])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id D0451420168
	for <drbd-dev@lists.linbit.com>; Fri, 15 Sep 2023 22:03:19 +0200 (CEST)
Received: by mail-pf1-f170.google.com with SMTP id
	d2e1a72fcca58-68fbd31d9deso2447699b3a.3
	for <drbd-dev@lists.linbit.com>; Fri, 15 Sep 2023 13:03:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=chromium.org; s=google; t=1694808198; x=1695412998;
	darn=lists.linbit.com; 
	h=content-transfer-encoding:mime-version:message-id:date:subject:cc
	:to:from:from:to:cc:subject:date:message-id:reply-to;
	bh=vqU6w0o7wis7lXYiV/PtYRUS9jkyqSgo8jH+nv7z2lQ=;
	b=FzTvIZl/uSr1783+3X07BMpP7jt5e84lVYjHJvYBUYCLetXQhDCqftVZzEQibVVMO5
	XR5dg24IlwbqPn5/jLRHZnq1eiUV7cYBIWlDGT+5c0DAAqfp8XCKS0YbxkFEqDEIuvgz
	ZXO1WKoDScyyDA9X/CIwP7xssb5SqhLjXntUY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20230601; t=1694808198; x=1695412998;
	h=content-transfer-encoding:mime-version:message-id:date:subject:cc
	:to:from:x-gm-message-state:from:to:cc:subject:date:message-id
	:reply-to;
	bh=vqU6w0o7wis7lXYiV/PtYRUS9jkyqSgo8jH+nv7z2lQ=;
	b=gv//cUpwWPBS3r/f6kFQgCswQruHSBgZ9QC6uoKarCNK5UKJANlROx9JWSBclbv8nv
	sF0TxWdcTkY9XZPAHDaPWLjnrwprBowEa3XH9hRWUf+vcXCQg5hgPSE3M9ntNeCmhduv
	4DuybJuK8NRaC8D+mX4U4A0QaWtvX0cCqf6bxU5lbLAZxW+joGEsf1pra8s7iquKSoLc
	dvjqKgmwriZo/eY4PEmYx2t7Yq3ntx6Kj1ARQ6+9eMkgDGP4nFSVWuYRL8JiBJfTm2eQ
	VBBmgRSyOmnGQvALqKbVIIlOLg5wwnlPh5c6GCWOhOJA0PcxYj/RTlpktalSHndtUCwz
	erSw==
X-Gm-Message-State: AOJu0YxVmOnCyZU4VrEyNr2mDgl2lYfF40JoMM2sHuPEmnwOzpNb/6TW
	Nt29YtASshxTXPz6qz02Y6oZjQ==
X-Google-Smtp-Source: AGHT+IH3OWyboutDfOfAciFvlgHKuWSpCyEFwnnry4+ZcBINS25y0aQgfc+F80nwPUf47he0MSKCZg==
X-Received: by 2002:a05:6a21:3d82:b0:155:bff3:ea1d with SMTP id
	bj2-20020a056a213d8200b00155bff3ea1dmr2858114pzc.58.1694808198682;
	Fri, 15 Sep 2023 13:03:18 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net.
	[198.0.35.241]) by smtp.gmail.com with ESMTPSA id
	s24-20020aa78298000000b0068be348e35fsm3327629pfm.166.2023.09.15.13.03.17
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 15 Sep 2023 13:03:18 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: Philipp Reisner <philipp.reisner@linbit.com>
Date: Fri, 15 Sep 2023 13:03:16 -0700
Message-Id: <20230915200316.never.707-kees@kernel.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1342; i=keescook@chromium.org; 
	h=from:subject:message-id;
	bh=ZUSAvLi9vR+UNAa6nUlqpsYdl2ki5xpNFUW+QWpv+Gs=; 
	b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBlBLiE6lCzis0gsISR4JNPawG7ZHd60KeU/nnbd
	V8maTMUfi2JAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCZQS4hAAKCRCJcvTf3G3A
	JkJlD/9l0pF1aFUgbVK4svrSUi+5O9iGRCXOXyoA8gV9689PopMTI0ye6wlfzm8Md0iYuPfhPXN
	PiDaHZayfKusmZu960KmvoYn86R3PC7vusckxDFxIgZLKpHbUlrnIEvHyffN6rhQz/U0x3f3FOZ
	Zo/+lHw5TwwltaJ0UuG4XxTzBmorhPU5VRUUvs8vN9MbJh+Zemw3EIECqisOwSLvIb44xn2EhsQ
	ik9K5alDkuinwcoxqirtInCYXfVkatpA9hycu0y4BxSbpaHfeLZ8bD7qFGFWPWuSPEkoRqag+5a
	I/lOP+ADDanjP1tHpdyL++/bWKhxpdzJQ/V4i6+OwO4240bpcoULvIZat0qzQ/Kc4O6E6V2FYEQ
	If+FqC7XhZfU4OxTEaOECJUi4i1ziEZcD2gyrR4ZOLOD6WhZr7lqtDXhRDtGvCD1vl+/3u/frmE
	5DpKvhGaM0oE+x4HjT7CKuptyzLPaNpdjfbLBI26/9nHIWMorznDsuAigef1YyWMjfRg7mDsWyv
	Wyf2UTzCBZPa4ezkhWjsFB9DAllI18T+IPzhY3S0g70qdnZvZDlJ3fDhraSbUyCE/e2jVgPbvJW
	6Tc6rXSm54n7WhP2cU6JIa/9pPv2J0rVcbUYyOqICMjEek0DhJ2EUyUa2umQjR49gGfT1cnVha9
	e44QrY/ OHYIMW1Q==
X-Developer-Key: i=keescook@chromium.org; a=openpgp;
	fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Cc: Jens Axboe <axboe@kernel.dk>, Nathan Chancellor <nathan@kernel.org>,
	Kees Cook <keescook@chromium.org>, Tom Rix <trix@redhat.com>,
	llvm@lists.linux.dev, Nick Desaulniers <ndesaulniers@google.com>,
	linux-kernel@vger.kernel.org, linux-block@vger.kernel.org,
	linux-hardening@vger.kernel.org,
	Lars Ellenberg <lars.ellenberg@linbit.com>, drbd-dev@lists.linbit.com
Subject: [Drbd-dev] [PATCH] drbd: Annotate struct fifo_buffer with
	__counted_by
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

UHJlcGFyZSBmb3IgdGhlIGNvbWluZyBpbXBsZW1lbnRhdGlvbiBieSBHQ0MgYW5kIENsYW5nIG9m
IHRoZSBfX2NvdW50ZWRfYnkKYXR0cmlidXRlLiBGbGV4aWJsZSBhcnJheSBtZW1iZXJzIGFubm90
YXRlZCB3aXRoIF9fY291bnRlZF9ieSBjYW4gaGF2ZQp0aGVpciBhY2Nlc3NlcyBib3VuZHMtY2hl
Y2tlZCBhdCBydW4tdGltZSBjaGVja2luZyB2aWEgQ09ORklHX1VCU0FOX0JPVU5EUwooZm9yIGFy
cmF5IGluZGV4aW5nKSBhbmQgQ09ORklHX0ZPUlRJRllfU09VUkNFIChmb3Igc3RyY3B5L21lbWNw
eS1mYW1pbHkKZnVuY3Rpb25zKS4KCkFzIGZvdW5kIHdpdGggQ29jY2luZWxsZVsxXSwgYWRkIF9f
Y291bnRlZF9ieSBmb3Igc3RydWN0IGZpZm9fYnVmZmVyLgoKWzFdIGh0dHBzOi8vZ2l0aHViLmNv
bS9rZWVzL2tlcm5lbC10b29scy9ibG9iL3RydW5rL2NvY2NpbmVsbGUvZXhhbXBsZXMvY291bnRl
ZF9ieS5jb2NjaQoKQ2M6IFBoaWxpcHAgUmVpc25lciA8cGhpbGlwcC5yZWlzbmVyQGxpbmJpdC5j
b20+CkNjOiBMYXJzIEVsbGVuYmVyZyA8bGFycy5lbGxlbmJlcmdAbGluYml0LmNvbT4KQ2M6ICJD
aHJpc3RvcGggQsO2aG13YWxkZXIiIDxjaHJpc3RvcGguYm9laG13YWxkZXJAbGluYml0LmNvbT4K
Q2M6IEplbnMgQXhib2UgPGF4Ym9lQGtlcm5lbC5kaz4KQ2M6IGRyYmQtZGV2QGxpc3RzLmxpbmJp
dC5jb20KQ2M6IGxpbnV4LWJsb2NrQHZnZXIua2VybmVsLm9yZwpTaWduZWQtb2ZmLWJ5OiBLZWVz
IENvb2sgPGtlZXNjb29rQGNocm9taXVtLm9yZz4KLS0tCiBkcml2ZXJzL2Jsb2NrL2RyYmQvZHJi
ZF9pbnQuaCB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlv
bigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvYmxvY2svZHJiZC9kcmJkX2ludC5oIGIvZHJpdmVy
cy9ibG9jay9kcmJkL2RyYmRfaW50LmgKaW5kZXggYTMwYTVlZDgxMWJlLi43ZWVjYzUzZmFlM2Qg
MTAwNjQ0Ci0tLSBhL2RyaXZlcnMvYmxvY2svZHJiZC9kcmJkX2ludC5oCisrKyBiL2RyaXZlcnMv
YmxvY2svZHJiZC9kcmJkX2ludC5oCkBAIC01NTMsNyArNTUzLDcgQEAgc3RydWN0IGZpZm9fYnVm
ZmVyIHsKIAl1bnNpZ25lZCBpbnQgaGVhZF9pbmRleDsKIAl1bnNpZ25lZCBpbnQgc2l6ZTsKIAlp
bnQgdG90YWw7IC8qIHN1bSBvZiBhbGwgdmFsdWVzICovCi0JaW50IHZhbHVlc1tdOworCWludCB2
YWx1ZXNbXSBfX2NvdW50ZWRfYnkoc2l6ZSk7CiB9OwogZXh0ZXJuIHN0cnVjdCBmaWZvX2J1ZmZl
ciAqZmlmb19hbGxvYyh1bnNpZ25lZCBpbnQgZmlmb19zaXplKTsKIAotLSAKMi4zNC4xCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmJkLWRldiBtYWls
aW5nIGxpc3QKZHJiZC1kZXZAbGlzdHMubGluYml0LmNvbQpodHRwczovL2xpc3RzLmxpbmJpdC5j
b20vbWFpbG1hbi9saXN0aW5mby9kcmJkLWRldgo=
