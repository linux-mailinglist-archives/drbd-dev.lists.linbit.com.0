Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A2122020D7
	for <lists+drbd-dev@lfdr.de>; Sat, 20 Jun 2020 05:33:51 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 48827420412;
	Sat, 20 Jun 2020 05:33:51 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
	[209.85.210.193])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id B90DA4203F3
	for <drbd-dev@lists.linbit.com>; Sat, 20 Jun 2020 05:30:23 +0200 (CEST)
Received: by mail-pf1-f193.google.com with SMTP id j1so5384479pfe.4
	for <drbd-dev@lists.linbit.com>; Fri, 19 Jun 2020 20:30:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=RzFNSuLALDDrnyEKhGNtGgKFtIzldBQWpd31RJVV1bk=;
	b=fzu/PCWhtk9lQC+R9MKh2Me02oxRal6DiRCuEURCWK9sXWB/CpSiB5Uv2tVNAE/CrC
	pGWzf/0loKr3cRxZRQNqF3uIOTSAInn1Kw7+AX1oW2pUGkJe0aav9Q03vOKBlLqHKkBU
	gGXsmhzRkdIhnbv/YLNgb64tFfCa2ZymPC9BU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=RzFNSuLALDDrnyEKhGNtGgKFtIzldBQWpd31RJVV1bk=;
	b=Rs++8TahSq7rtAfVcCEobuN0vswTrXV6qSoEpK/ZSRbEcAfgDQj2ia0rjw+3FYlj0X
	oJ91+gbXtbDQ429E1VJ1eXIrnw4AxOgGAemDQkVyEL0l48DBmNyxtxhHW6RGBd8keILI
	PSN+tlLHfAzZiGr4eYLqRxVoJzIh+55Oi16S9bGjfNMuWFEEZH0nhvzLMyC5a+ooR3hS
	XmtLOXUG8vStxDqNo38qbBsmGggtTVkn1MkO5vEeDheF367rMrft8GSAtaVzeU9QC/Kb
	RIRhdQnIZjm0kq2RJxcIeQM2n5EgJeItNQF4q6LSeOZQABafPEnfJ1QLnzDi+WhB0G5k
	oHTA==
X-Gm-Message-State: AOAM533A0q4UrEknSKS6pxjyVc928CrxYrN90ZzBeJeUIT/L3A6FJ9gG
	sfg18u50KrVGmE9o7hFmNzmPqw==
X-Google-Smtp-Source: ABdhPJxH7/9V1MTULJxl6mnEJxFeDjiakGfZWrFzazGy+IRxsSCrDXTNem0tGYNNX/5vbkAV8ntgLg==
X-Received: by 2002:a63:7c51:: with SMTP id l17mr5231899pgn.303.1592623822618; 
	Fri, 19 Jun 2020 20:30:22 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
	by smtp.gmail.com with ESMTPSA id 1sm7140732pfx.210.2020.06.19.20.30.19
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 19 Jun 2020 20:30:20 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: linux-kernel@vger.kernel.org
Date: Fri, 19 Jun 2020 20:29:59 -0700
Message-Id: <20200620033007.1444705-9-keescook@chromium.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200620033007.1444705-1-keescook@chromium.org>
References: <20200620033007.1444705-1-keescook@chromium.org>
MIME-Version: 1.0
Cc: Andy Whitcroft <apw@canonical.com>, linux-wireless@vger.kernel.org,
	Kees Cook <keescook@chromium.org>, linux-doc@vger.kernel.org,
	netdev@vger.kernel.org, x86@kernel.org,
	Nick Desaulniers <ndesaulniers@google.com>,
	linux-spi@vger.kernel.org, linux-block@vger.kernel.org,
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	clang-built-linux@googlegroups.com, linux-mm@kvack.org,
	Alexander Potapenko <glider@google.com>,
	b43-dev@lists.infradead.org, linux-ide@vger.kernel.org,
	Joe Perches <joe@perches.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	linux-clk@vger.kernel.org, drbd-dev@lists.linbit.com
Subject: [Drbd-dev] [PATCH v2 08/16] spi: davinci: Remove
	uninitialized_var() usage
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
bGUgc2luY2UgaXQgd2FzCmFjdHVhbGx5IHVudXNlZDoKCmRyaXZlcnMvc3BpL3NwaS1kYXZpbmNp
LmM6IEluIGZ1bmN0aW9uIOKAmGRhdmluY2lfc3BpX2J1ZnPigJk6CmRyaXZlcnMvc3BpL3NwaS1k
YXZpbmNpLmM6NTc5OjExOiB3YXJuaW5nOiB1bnVzZWQgdmFyaWFibGUg4oCYcnhfYnVmX2NvdW50
4oCZIFstV3VudXNlZC12YXJpYWJsZV0KICA1NzkgfCAgdW5zaWduZWQgcnhfYnVmX2NvdW50Owog
ICAgICB8ICAgICAgICAgICBefn5+fn5+fn5+fn4KClsxXSBodHRwczovL2xvcmUua2VybmVsLm9y
Zy9sa21sLzIwMjAwNjAzMTc0NzE0LjE5MjAyNy0xLWdsaWRlckBnb29nbGUuY29tLwpbMl0gaHR0
cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGttbC9DQSs1NWFGdytWYmowaT0xVEdxQ1I1dlFrQ3pXSjBR
eEs2Q2Vybk9VNmVlZHN1ZEFpeHdAbWFpbC5nbWFpbC5jb20vClszXSBodHRwczovL2xvcmUua2Vy
bmVsLm9yZy9sa21sL0NBKzU1YUZ3Z2JncWhicDFma3h2UktFcHp5UjVKOG4xdktUMVZaZHo5a25t
UHVYaE9lZ0BtYWlsLmdtYWlsLmNvbS8KWzRdIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xrbWwv
Q0ErNTVhRnoyNTAwV2ZiS1hBeDhzNjd3cm05PXlWSnU2NVRwTGdOX3liWU52MFZFT0tBQG1haWwu
Z21haWwuY29tLwoKRml4ZXM6IDA0ODE3N2NlM2IzOSAoInNwaTogc3BpLWRhdmluY2k6IGNvbnZl
cnQgdG8gRE1BIGVuZ2luZSBBUEkiKQpSZXZpZXdlZC1ieTogTmljayBEZXNhdWxuaWVycyA8bmRl
c2F1bG5pZXJzQGdvb2dsZS5jb20+ClNpZ25lZC1vZmYtYnk6IEtlZXMgQ29vayA8a2Vlc2Nvb2tA
Y2hyb21pdW0ub3JnPgotLS0KIGRyaXZlcnMvc3BpL3NwaS1kYXZpbmNpLmMgfCAxIC0KIDEgZmls
ZSBjaGFuZ2VkLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9zcGkvc3BpLWRh
dmluY2kuYyBiL2RyaXZlcnMvc3BpL3NwaS1kYXZpbmNpLmMKaW5kZXggZjcxYzQ5NzM5M2E2Li5m
NTBjMGM3OWNiZGYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvc3BpL3NwaS1kYXZpbmNpLmMKKysrIGIv
ZHJpdmVycy9zcGkvc3BpLWRhdmluY2kuYwpAQCAtNTc2LDcgKzU3Niw2IEBAIHN0YXRpYyBpbnQg
ZGF2aW5jaV9zcGlfYnVmcyhzdHJ1Y3Qgc3BpX2RldmljZSAqc3BpLCBzdHJ1Y3Qgc3BpX3RyYW5z
ZmVyICp0KQogCXUzMiBlcnJvcnMgPSAwOwogCXN0cnVjdCBkYXZpbmNpX3NwaV9jb25maWcgKnNw
aWNmZzsKIAlzdHJ1Y3QgZGF2aW5jaV9zcGlfcGxhdGZvcm1fZGF0YSAqcGRhdGE7Ci0JdW5zaWdu
ZWQgdW5pbml0aWFsaXplZF92YXIocnhfYnVmX2NvdW50KTsKIAogCWRzcGkgPSBzcGlfbWFzdGVy
X2dldF9kZXZkYXRhKHNwaS0+bWFzdGVyKTsKIAlwZGF0YSA9ICZkc3BpLT5wZGF0YTsKLS0gCjIu
MjUuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJi
ZC1kZXYgbWFpbGluZyBsaXN0CmRyYmQtZGV2QGxpc3RzLmxpbmJpdC5jb20KaHR0cHM6Ly9saXN0
cy5saW5iaXQuY29tL21haWxtYW4vbGlzdGluZm8vZHJiZC1kZXYK
