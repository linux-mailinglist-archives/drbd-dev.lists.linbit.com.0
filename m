Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A2441ED94E
	for <lists+drbd-dev@lfdr.de>; Thu,  4 Jun 2020 01:34:46 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 622054203FB;
	Thu,  4 Jun 2020 01:34:46 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com
	[209.85.214.193])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id C965A4203EA
	for <drbd-dev@lists.linbit.com>; Thu,  4 Jun 2020 01:32:18 +0200 (CEST)
Received: by mail-pl1-f193.google.com with SMTP id m7so1379508plt.5
	for <drbd-dev@lists.linbit.com>; Wed, 03 Jun 2020 16:32:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=vlsGh/2A3yd9dyMlCDYBd0p4l1T5Oo7IaL6NTs2MBUk=;
	b=TU9flWAg9FMH+Npku3SFev/YYK6vvYYCp6jsnIW2uRPdSGDM2UMjhH0to/RSt2mcu+
	+tEJTAZqQ0UV4spAC//nbMEU4YZmc6CW1cgHcGYV50zllOcjZjx+9n/jCEKcVaB/68HX
	WckrYbpJZIVMmdggrVZUzoJLKS1NezuTTfatg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=vlsGh/2A3yd9dyMlCDYBd0p4l1T5Oo7IaL6NTs2MBUk=;
	b=jcOyx3ukmZGndYEIXqNthxQjiCzOAXBlEzhpRNDoutMDOWokKydGCcxBto6JsCNoju
	gFXs7VZAKauFLjbPzJk+cubLby9qRutAlUyRAN3RtUNWANRWxs0/qLSdk90zINqGCRcl
	ngY+LzOBCOXU1pN+XktsBexY4cnBVsrDjh+SvHcqkzh1m7v20DUXhXQW/f0fxV5u61hh
	9vzinCiYAOu8RnR1tWbNgXY2vpq/DuuEQVgP4iNmOqQhCpHANh3JqgNL/d44J5k5IIRg
	P53e2AH4Ap4Ak9L1YALzU2qN9wCJ+fDXo3FLOCx7oS8ZSwMTM/S4aN8eTk8tWisP65Xm
	g67Q==
X-Gm-Message-State: AOAM5333jB5PaqRCUYFTxSe7gAu08VTLCPgXsZqHzSu1Q1KyHig4tSu0
	HE4TdMM1GauDGTHH65qqtH+QGg==
X-Google-Smtp-Source: ABdhPJyBu+lQtrGYhp3WZ7ZyvY1X8s9WoOeJvHWXF5Ulh61p00d2PYdWCaVGKn3LkWqTOEtrYGlBGw==
X-Received: by 2002:a17:902:aa0c:: with SMTP id
	be12mr2119692plb.241.1591227137753; 
	Wed, 03 Jun 2020 16:32:17 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
	by smtp.gmail.com with ESMTPSA id b1sm3836817pjc.33.2020.06.03.16.32.14
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 03 Jun 2020 16:32:16 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: linux-kernel@vger.kernel.org
Date: Wed,  3 Jun 2020 16:31:59 -0700
Message-Id: <20200603233203.1695403-7-keescook@chromium.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200603233203.1695403-1-keescook@chromium.org>
References: <20200603233203.1695403-1-keescook@chromium.org>
MIME-Version: 1.0
Cc: Andy Whitcroft <apw@canonical.com>, Kees Cook <keescook@chromium.org>,
	linux-ide@vger.kernel.org, netdev@vger.kernel.org,
	x86@kernel.org, linux-wireless@vger.kernel.org,
	linux-spi@vger.kernel.org, linux-block@vger.kernel.org,
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	linux-mm@kvack.org, Alexander Potapenko <glider@google.com>,
	b43-dev@lists.infradead.org, clang-built-linux@googlegroups.com,
	Joe Perches <joe@perches.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	linux-clk@vger.kernel.org, drbd-dev@lists.linbit.com
Subject: [Drbd-dev] [PATCH 06/10] clk: st: Remove uninitialized_var() usage
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

VXNpbmcgdW5pbml0aWFsaXplZF92YXIoKSBpcyBkYW5nZXJvdXMgYXMgaXQgcGFwZXJzIG92ZXIg
cmVhbCBidWdzWzFdCihvciBjYW4gaW4gdGhlIGZ1dHVyZSksIGFuZCBzdXBwcmVzc2VzIHVucmVs
YXRlZCBjb21waWxlciB3YXJuaW5ncyAoZS5nLgoidW51c2VkIHZhcmlhYmxlIikuIElmIHRoZSBj
b21waWxlciB0aGlua3MgaXQgaXMgdW5pbml0aWFsaXplZCwgZWl0aGVyCnNpbXBseSBpbml0aWFs
aXplIHRoZSB2YXJpYWJsZSBvciBtYWtlIGNvbXBpbGVyIGNoYW5nZXMuIEFzIGEgcHJlY3Vyc29y
CnRvIHJlbW92aW5nWzJdIHRoaXNbM10gbWFjcm9bNF0sIGp1c3QgcmVtb3ZlIHRoaXMgdmFyaWFi
bGUgc2luY2UgaXQgd2FzCmFjdHVhbGx5IHVudXNlZDoKCmRyaXZlcnMvY2xrL3N0L2Nsa2dlbi1m
c3luLmM6IEluIGZ1bmN0aW9uIOKAmHF1YWRmc19zZXRfcmF0ZeKAmToKZHJpdmVycy9jbGsvc3Qv
Y2xrZ2VuLWZzeW4uYzo3OTM6Njogd2FybmluZzogdW51c2VkIHZhcmlhYmxlIOKAmGnigJkgWy1X
dW51c2VkLXZhcmlhYmxlXQogIDc5MyB8ICBpbnQgaTsKICAgICAgfCAgICAgIF4KClsxXSBodHRw
czovL2xvcmUua2VybmVsLm9yZy9sa21sLzIwMjAwNjAzMTc0NzE0LjE5MjAyNy0xLWdsaWRlckBn
b29nbGUuY29tLwpbMl0gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGttbC9DQSs1NWFGdytWYmow
aT0xVEdxQ1I1dlFrQ3pXSjBReEs2Q2Vybk9VNmVlZHN1ZEFpeHdAbWFpbC5nbWFpbC5jb20vClsz
XSBodHRwczovL2xvcmUua2VybmVsLm9yZy9sa21sL0NBKzU1YUZ3Z2JncWhicDFma3h2UktFcHp5
UjVKOG4xdktUMVZaZHo5a25tUHVYaE9lZ0BtYWlsLmdtYWlsLmNvbS8KWzRdIGh0dHBzOi8vbG9y
ZS5rZXJuZWwub3JnL2xrbWwvQ0ErNTVhRnoyNTAwV2ZiS1hBeDhzNjd3cm05PXlWSnU2NVRwTGdO
X3liWU52MFZFT0tBQG1haWwuZ21haWwuY29tLwoKU2lnbmVkLW9mZi1ieTogS2VlcyBDb29rIDxr
ZWVzY29va0BjaHJvbWl1bS5vcmc+Ci0tLQogZHJpdmVycy9jbGsvc3QvY2xrZ2VuLWZzeW4uYyB8
IDEgLQogMSBmaWxlIGNoYW5nZWQsIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJz
L2Nsay9zdC9jbGtnZW4tZnN5bi5jIGIvZHJpdmVycy9jbGsvc3QvY2xrZ2VuLWZzeW4uYwppbmRl
eCBhMTU2YmQwYzZhZjcuLmYxYWRjODU4YjU5MCAxMDA2NDQKLS0tIGEvZHJpdmVycy9jbGsvc3Qv
Y2xrZ2VuLWZzeW4uYworKysgYi9kcml2ZXJzL2Nsay9zdC9jbGtnZW4tZnN5bi5jCkBAIC03OTAs
NyArNzkwLDYgQEAgc3RhdGljIGludCBxdWFkZnNfc2V0X3JhdGUoc3RydWN0IGNsa19odyAqaHcs
IHVuc2lnbmVkIGxvbmcgcmF0ZSwKIAlzdHJ1Y3Qgc3RfY2xrX3F1YWRmc19mc3ludGggKmZzID0g
dG9fcXVhZGZzX2ZzeW50aChodyk7CiAJc3RydWN0IHN0bV9mcyBwYXJhbXM7CiAJbG9uZyBod3Jh
dGU7Ci0JaW50IHVuaW5pdGlhbGl6ZWRfdmFyKGkpOwogCiAJaWYgKCFyYXRlIHx8ICFwYXJlbnRf
cmF0ZSkKIAkJcmV0dXJuIC1FSU5WQUw7Ci0tIAoyLjI1LjEKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyYmQtZGV2IG1haWxpbmcgbGlzdApkcmJkLWRl
dkBsaXN0cy5saW5iaXQuY29tCmh0dHBzOi8vbGlzdHMubGluYml0LmNvbS9tYWlsbWFuL2xpc3Rp
bmZvL2RyYmQtZGV2Cg==
